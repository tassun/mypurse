;(function($) {
	
$.fn.customerlookup = function(settings) {
	var that = $(this);
	var lookupDefaults = {
			dialogTitle : "Customer Lookup",
			dialogWidth : 870,
			dialogHeight : 485,
			dialogURL : "../nav/nav002.jsp?seed="+Math.random(),
			dialogFeatures : "scrollbars=no;center=yes;border=thin;help=no;status=no;resizable=yes;",
			afterLookup : function(data,reply) { 
				var adata = null;
				if(data.cell) {
					adata = data;
				} else adata = data[0];
				that.val(adata.cell[0]); 
				try { 
					$("#"+that.attr("id")+"desc").html(adata.cell[1]+" "+adata.cell[2]); 
					if(data.language && ("EN"==data.language)) {
						$("#"+that.attr("id")+"desc").html(adata.cell[3]+" "+adata.cell[4]); 
					}
				}catch(ex) { }				
			},	
			singleSelect: true,
			afterOpen : function(reply) { }
	};
	var p = $.extend({},lookupDefaults, settings);	
	p.query = that.val();

	var fs_frame_id = 'fs_lookup_iframe_' + Math.round(new Date().getTime() / 1000);
	var fs_lookupframe = $("<iframe id='"+fs_frame_id+"' name='"+fs_frame_id+"' width='100%' height='100%' scrolling='no' frameBorder='0'></iframe>");
	var fs_dialoglayer = $("<div style='display:none; padding: 5px;'></div>");
	fs_dialoglayer.append(fs_lookupframe);
	$("body").after(fs_dialoglayer);
	var fs_lookupdialog = fs_dialoglayer.dialog({
		autoOpen: false, modal: true, title: p.dialogTitle,
		width: p.dialogWidth, height: p.dialogHeight, 
		open: function( event, ui ) { 
			var par = fs_dialoglayer.parent();
			var pos = par.position();
			var h = (p.dialogHeight + 10 - par.height()) / 2;
			fs_dialoglayer.height(p.dialogHeight+10);  
			par.css("top", pos.top - h);
		},
		beforeClose: function( event, ui ) { setTimeout(function() { try { fs_dialoglayer.remove(); }catch(ex) { } },500); }
	});
	window.getShowLookupDialogArguments = function() { return p; };
	window.closeLookupDialog = function() { try { fs_lookupdialog.dialog("close"); } catch(ex) { } };
	window.afterShowLookupDialog = function(args) { 
		try { fs_lookupdialog.dialog("close"); } catch(ex) { }
		try { p.afterLookup(args); } catch(ex) { }
	};
	var fs_lookupwin = window.open(p.dialogURL,fs_frame_id);
	fs_lookupwin.opener = self;
	fs_lookupdialog.dialog("open");
};

$.fn.userlookup = function(settings) {
	var that = $(this);
	var lookupDefaults = {
			dialogTitle : "User Lookup",
			dialogWidth : 830,
			dialogHeight : 460,
			dialogURL : "../nav/nav003.jsp?seed="+Math.random(),
			dialogFeatures : "scrollbars=no;center=yes;border=thin;help=no;status=no;resizable=yes;",
			afterLookup : function(data,reply) { 
				var adata = null;
				if(data.cell) {
					adata = data;
				} else adata = data[0];
				that.val(adata.cell[0]); 
				try { 
					if(data.language && ("EN"==data.language)) {
						$("#"+that.attr("id")+"desc").html(adata.cell[1]+"  "+adata.cell[2]); 
					} else {
						$("#"+that.attr("id")+"desc").html(adata.cell[1]+"  "+adata.cell[2]); 
					}
				}catch(ex) { }				
			},	
			singleSelect: true,
			enable : true,
			afterOpen : function(reply) { }
	};
	var p = $.extend({},lookupDefaults, settings);	
	if(!p.enable) {
		var autoHeight = p.dialogHeight==lookupDefaults.dialogHeight?400:p.dialogHeight;
		p.dialogHeight = autoHeight;
	}
	p.query = that.val();

	var fs_frame_id = 'fs_lookup_iframe_' + Math.round(new Date().getTime() / 1000);
	var fs_lookupframe = $("<iframe id='"+fs_frame_id+"' name='"+fs_frame_id+"' width='100%' height='100%' scrolling='no' frameBorder='0'></iframe>");
	var fs_dialoglayer = $("<div style='display:none; padding: 5px;'></div>");
	fs_dialoglayer.append(fs_lookupframe);
	$("body").after(fs_dialoglayer);
	var fs_lookupdialog = fs_dialoglayer.dialog({
			autoOpen: false, modal: true, title: p.dialogTitle,
			width: p.dialogWidth, height: p.dialogHeight, 
			open: function( event, ui ) { 
				var par = fs_dialoglayer.parent();
				var pos = par.position();
				var h = (p.dialogHeight + 10 - par.height()) / 2;
				fs_dialoglayer.height(p.dialogHeight+10);  
				par.css("top", pos.top - h);
			},
			beforeClose: function( event, ui ) { setTimeout(function() { try { fs_dialoglayer.remove(); }catch(ex) { } },500); }
	});
	window.getShowLookupDialogArguments = function() { return p; };
	window.closeLookupDialog = function() { try { fs_lookupdialog.dialog("close"); } catch(ex) { } };
	window.afterShowLookupDialog = function(args) { 
		try { fs_lookupdialog.dialog("close"); } catch(ex) { }
		try { p.afterLookup(args); } catch(ex) { }
	};
	var fs_lookupwin = window.open(p.dialogURL,fs_frame_id);
	fs_lookupwin.opener = self;
	fs_lookupdialog.dialog("open");
};

$.fn.getcustomer = function(settings) {
	var defaults = {
			async : true,
			dataType : "json",
			method : "POST",			
			url : "../nav/nav002_c.jsp",
			searchOptions : [{name:"fetch", value:"true"}, {name:"searchoption", value:"H"}],
			params : null,
			keys : [],
			keycode : null,
			afterPopulate : function(data,status,xhr) { 
			}	
	};
	var p = $.extend({},defaults, settings);	
	if(p.keycode) p.keys.push({name:"customerid", value:p.keycode});
	if(p.url && (p.params || p.keys)) {
		var opts = $.merge(p.searchOptions,p.keys?p.keys:[]);
		var params = $.param(opts)+(p.params?p.params:"");
		$.ajax({
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async : p.async,
			type: p.method,
			url: p.url,
			data: params,
			dataType: p.dataType,
			success: function(adata,status,xhr){ if(p.afterPopulate) p.afterPopulate(adata,status,xhr); },
			error: function(adata) { try { if (p.onError) p.onError(adata); } catch (e) {} }
		});
	}
};

$.fn.getuser = function(settings) {
	var defaults = {
			async : true,
			dataType : "json",
			method : "POST",			
			url : "../nav/nav003_c.jsp",
			searchOptions : [{name:"fetch", value:"true"}, {name:"searchoption", value:"H"}],
			params : null,
			keys : [],
			afterPopulate : function(data,status,xhr) { 
			}	
	};
	var p = $.extend({},defaults, settings);	
	if(p.keycode) p.keys.push({name:"userid", value:p.keycode});
	if(p.url && (p.keys || p.params)) {
		var opts = $.merge(p.searchOptions,p.keys?p.keys:[]);
		var params = $.param(opts)+(p.params?p.params:"");
		$.ajax({
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async : p.async,
			type: p.method,
			url: p.url,
			data: params,
			dataType: p.dataType,
			success: function(adata,status,xhr){ if(p.afterPopulate) p.afterPopulate(adata,status,xhr); },
			error : function(transport,status,errorThrown) { try { if (p.onError) p.onError(transport,status,errorThrown); } catch (e) {} }
		});
	}
};

})(jQuery);
