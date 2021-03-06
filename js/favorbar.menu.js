			var fs_current_favor_item;
			var fs_favor_prog_ary;
			function showNewFavorItem() {
				$("#favorcoverbarmenu").show();
				$("#favornewitemlayer").show();
			}
			function hideNewFavorItem() {
				$("#favorcoverbarmenu").hide();
				$("#favornewitemlayer").hide();
			}
			function addBlankMenuItem(alink) {
				var seqno = alink.attr("seqno");
				//$blank = $("<a href=\"#\" class=\"tile fa-box-title fav-blank\" title=\"New Favorite\"><div class=\"icon\"><img class=\"fa fa-app-image\" src=\"img/apps/fs_icon.png\" /></div><span class=\"title\"><i class=\"fa fa-plus\"></i></span></a>");
				$blank = $("<a href=\"javascript:void(0);\" class=\"tile fa-box-title fav-blank\" title=\"New Favorite\" seqno=\""+seqno+"\"><div class=\"icon\"><img class=\"fa fa-app-image\" src=\"img/apps/fs_icon.png\" /></div><span class=\"title\">Add New</span></a>");
				$blank.click(function(evt) { 
					evt.stopPropagation();
					fs_current_favor_item = $(this);
					showNewFavorItem();
					//insertNewFavorMenuItem($(this));
					//$(this).remove();						
				});
				$blank.insertBefore(alink);
			}
			function setupOpenLink(alink) {
				var pid = alink.attr("pid");
				if(pid && pid!="") alink.click(function(evt) { open_page(pid,evt); });
			}
			function setupTodo(alink) {
				//var $del = $("<li><img src=\"jquery/images/page_white_delete.png\" title=\"Delete\"/></li>");
				var $del = $("<li><img src=\"images/delete_icon.png\" title=\"Delete\" width=\"25px\" height=\"25px\"/></li>");
				$del.click(function(evt) { 
					evt.stopPropagation();
					/*
					$blank = $("<a href=\"javascript:void(0);\" class=\"tile fa-box-title fav-blank\" title=\"New Favorite\"><div class=\"icon\"><img class=\"fa fa-app-image\" src=\"img/apps/fs_icon.png\" /></div><span class=\"title\"><i class=\"fa fa-plus\"></i></span></a>");
					$blank.click(function(evt) { 
						evt.stopPropagation();
						insertNewFavorMenuItem($blank);
						$blank.remove();						
					});
					$blank.insertBefore(alink);
					*/
					var fs_user = $("#login_user").val();
					var fs_seqno = alink.attr("seqno");
					var fs_prog = alink.attr("pid");
					if(fs_prog && fs_prog!="") {
						jQuery.ajax({
							url: "main/favor_menu_dc.jsp",
							type: "POST",
							data: "fsAjax=true&fsAction=delete&userid="+fs_user+"&progid="+fs_prog+"&seqno="+fs_seqno,
							dataType: "html",
							contentType: defaultContentType,
							error : function(transport,status,errorThrown) { 
								submitFailure(transport,status,errorThrown);  
							},
							success: function(data,status,transport){ 
							}
						});	
					}
					addBlankMenuItem(alink);
					alink.remove(); 
				});
				/*
				var $edit = $("<li><img src=\"jquery/images/page_white_edit.png\"/></li>");
				$edit.click(function(evt) { 
					evt.stopPropagation();
				});*/
				var $todo = $("<ul class=\"todo\" style=\"display:none;\"></ul>").append($del);
				alink.append($todo);
				alink.hover(function() { 
						$todo.show();
					},function() { 
						$todo.hide();
				});
			}
			function insertNewFavorMenuItem(alink,fs_prog,fs_title,fs_icon) {
				if(!fs_prog || !fs_title || !fs_icon) return;
				var fs_seqno = alink.attr("seqno");
				var fs_user = $("#login_user").val();
				//var fs_prog = "page_log";
				//var $newlink = $("<a href=\"javascript:void(0);\" class=\"tile fa-box-title fa-apps\"><div class=\"icon\"><i class=\"fa fa-university\"></i></div><span class=\"title\">Institution</span></a>");
				var $newlink = $("<a href=\"javascript:void(0);\" class=\"tile fa-box-title fav-app\" pid=\""+fs_prog+"\" seqno=\""+fs_seqno+"\"><div class=\"icon\"><img class=\"fa fa-app-image\" src=\"img/apps/"+fs_icon+"\" /></div><span class=\"title\">"+fs_title+"</span></a>");
				if(fs_prog && fs_prog!="") {
					jQuery.ajax({
						url: "main/favor_menu_dc.jsp",
						type: "POST",
						data: "fsAjax=true&fsAction=insert&userid="+fs_user+"&progid="+fs_prog+"&seqno="+fs_seqno,
						dataType: "html",
						contentType: defaultContentType,
						error : function(transport,status,errorThrown) { 
							submitFailure(transport,status,errorThrown);  
						},
						success: function(data,status,transport){ 
							$newlink.insertBefore(alink);
							setupOpenLink($newlink);
							setupTodo($newlink);
							setupContextMenu("favorbarmenu","favorcontextmenu",$newlink);
							alink.remove();
						}
					});	
				}
			}
			function bindingOnFavorMenu() {
				$("a",$("#favorbarmenu")).each(function(index,element) { 
					var alink = $(element);
					if(!alink.is(".fav-app")) {
						alink.click(function(evt) { 
							evt.stopPropagation();
							fs_current_favor_item = alink;
							showNewFavorItem();
							//insertNewFavorMenuItem(alink);
							//alink.remove();
						});						
					} else {
						setupOpenLink(alink);
						setupTodo(alink);
					}
				});
				setupContextMenu("favorbarmenu","favorcontextmenu");
			}			
			function addNewFavorMenuItem(title,evt) {
				var favorbar = $("#favorbarmenu");
				var len = favorbar.find("a").length;
				if(len>14) favorbar.find("a:eq(0)").remove();
				var $newlink = $("<a href=\"javascript:void(0);\" class=\"tile fa-box-title\"><div class=\"icon\"><i class=\"fa fa-university\"></i></div><span class=\"title\">"+title+"</span></a>");
				favorbar.append($newlink);
				if(evt) evt.stopPropagation();
				if(!$("#favormenuitem").is(".open")) $("#favormenuitemlink").trigger("click");
			}
			function inputNewFavorMenuItem(evt) {
				if(evt) evt.stopPropagation();
    			bootbox.prompt({
					title: "Favorite Menu", 
					value: "Institute", 
					callback: function(result) {
						if(result && result!="") {
							addNewFavorMenuItem(result);
						}
					}
    			}); 
			}			
			function setupContextMenu(containerID,menuID,element) {
				if(!element) element = "a.fav-app";
				$(element,$("#"+containerID)).contextMenu({
						menu: menuID
					},
					function(action, el, pos) {
						if(action=="edit") {
							return;
						}
						if(action=="delete") {
							//alert($(el).html());
							var alink = $(el);
							addBlankMenuItem(alink);
							alink.remove();
							return;
						}
				});
			}
			function load_prog_item() {
				var fs_user = $("#login_user").val();
				jQuery.ajax({
					url: "main/favor_prog.jsp",
					type: "POST",
					data: "fsAjax=true&fsDatatype=category&userid="+fs_user,
					dataType: "json",
					contentType: defaultContentType,
					error : function(transport,status,errorThrown) { 
					},
					success: function(data,status,transport){ 
						fs_favor_prog_ary = data;
						prepareOptions(fs_favor_prog_ary,"progcategory",$("#favorprogitem").empty());
					}
				});	
			}
			$(function(){
				$("#favornewitem").click(function(evt){
					evt.stopPropagation();
					//inputNewFavorMenuItem(evt);
					hideNewFavorItem();
					if(fs_current_favor_item) {
						var fs_prog = $("#favorprogitem").val();
						var fs_title = $("option:selected",$("#favorprogitem")).text();
						var fs_icon = fs_prog+".png";
						insertNewFavorMenuItem(fs_current_favor_item,fs_prog,fs_title,fs_icon);
					}
				});
				$("#favorprogitem").click(function(evt) { 
					evt.stopPropagation();
				});
				$("#favorcancelitem").click(function(evt) { 
					evt.stopPropagation();
					hideNewFavorItem();
				});
			});