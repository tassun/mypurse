var page_item = $.extend({},base,{
	title: "My Journal List",
	init: function(setting) { 
		page_item.setupComponents();
	},
	setupComponents : function() {
		$("#pageremainder").append($("#entrypanel"));
		$("#insertbutton").click(function() { 
			page_item.insert();
			return false;
		});
		$("#refreshbutton").click(function() { 
			page_item.search();
			return false;
		});
		$("#page_item_savebutton").click(function() { 
			page_item.save();
			return false;
		});
		$("input.my-input").focus(function() { 
			$("#"+$(this).attr("id")+"_layer").removeClass("has-error");
			$("#"+$(this).attr("id")+"_alert").hide();
		}).blur(function() { 
			if($.trim($(this).val())=="") {
				$("#"+$(this).attr("id")+"_alert").show();
			}
			$("#"+$(this).attr("id")+"_error").hide();
		});
	},
	clearingFields : function() {
		page_item_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_item.clearingFields();
		});
	},
	validForm : function() {
		var valid = true;
		if($.trim($("#cdname").val())=="") {
			$("#cdname_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#amt").val())=="") {
			$("#amt_layer").addClass("has-error");
			valid = false;
		}
		try{
			var cdamt = parseFloat($("#amt").val());
			if(!cdamt || isNaN($("#amt").val())) {
				$("#amt_layer").addClass("has-error");
				$("#amt_error").show();
				return false;
			}
			if(cdamt<=0) {
				$("#amt_layer").addClass("has-error");
				$("#amt_error").show();
				return false;
			}
		}catch(ex) { 
			$("#amt_layer").addClass("has-error");
			$("#amt_error").show();
			return false;
		}
		return valid;
	},
	search : function(aform) {
		if(!aform) aform = fssearchform;
		startWaiting();
		jQuery.ajax({
			url: "page_item/page_item_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				page_item.searchComplete(transport,data);
			}
		});	
	},
	searchComplete : function(xhr,data) {
		stopWaiting();
		$("#listpanel").html(data);
	},
	edit : function() {
		page_item_form.fsAction.value = "edit";
		var label = fs_getLabelName("edit_modalheader",fs_currentpid,fs_default_language);
		if(!label || label=="") label = "Edit Journal List";
		$("#modalheader").html(label);
		$("#page_item_savebutton").show();
		$("#page_item_savebutton").unbind("click");
		$("#page_item_savebutton").bind("click",function() { 
			page_item.save();
			return false;
		});
		$("#page_item_detail").modal("show");
	},
	insert : function() {
		page_item_form.fsAction.value = "enter";
		$("#cdname").val("");
		$("#amt").val("");
		var label = fs_getLabelName("new_modalheader",fs_currentpid,fs_default_language);
		if(!label || label=="") label = "New Journal List";
		$("#modalheader").html(label);
		$("#page_item_savebutton").show();
		$("#page_item_savebutton").unbind("click");
		$("#page_item_savebutton").bind("click",function() { 
			page_item.save();
			return false;
		});
		$("#page_item_detail").modal("show");
	},
	view : function() {
		page_item_form.fsAction.value = "edit";		
		var label = fs_getLabelName("view_modalheader",fs_currentpid,fs_default_language);
		if(!label || label=="") label = "View Journal List";
		$("#modalheader").html(label);
		$("#page_item_savebutton").hide();
		$("#page_item_detail").modal("show");
	},
	save : function(aform) {
		if(!aform) aform = page_item_form;
		if(!page_item.validForm()) return false;
		confirmSave(function() {
			startWaiting();
			var xhr = jQuery.ajax({
				url: "page_item/page_item_de_c.jsp",
				type: "POST",
				data: $(aform).serialize(),
				dataType: "html",
				contentType: defaultContentType,
				error : function(transport,status,errorThrown) { 
					submitFailure(transport,status,errorThrown);  
				},
				success: function(data,status,transport){ 
					stopWaiting();
					fssearchform.fsPage.value = fslistform.fsPage.value;
					page_item.search();
					successbox(function() { 
						$("#page_item_detail").modal("hide");
					});					
				}
			});
		});
		return false;
	},
	switchingLanguage : function(lang) {
		var placeholder = fs_getLabelName("cdname_placeholder",fs_currentpid,lang);
		if(placeholder) $("#cdname").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("amt_placeholder",fs_currentpid,lang);
		if(placeholder) $("#amt").attr("placeholder",placeholder);
		var atitle = fs_getLabelName("insertbutton_title",fs_currentpid,lang);
		if(atitle) $("#insertbutton").attr("title",atitle);
	},
	submitRetrieve : function(rowIndex,fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_item/page_item_de_c.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: "fsAjax=true&fsAction=retrieve&fsDatatype=text&cdcode="+fsParams[0],
			dataType: "html",
			error : function(transport,status,errorThrown) { 
				submitFailure(transport,status,errorThrown);  
			},
			success: function(data,status,transport){
				stopWaiting();
				$("#pageremainder").html($.trim(data));
				page_item.edit();
			}
		});
	},
	submitChapter : function(aform,index) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_item/page_item_cp.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: $(aform).serialize(),
			dataType: "html",
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				stopWaiting();
				$("#listpanel").html(data);
			}
		});
	},
	submitOrder : function(fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_item/page_item_cd.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: fsParams,
			dataType: "html",
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				stopWaiting();
				$("#listpanel").html(data);
			}
		});
		return false;
	},
	submitDelete : function(fsParams,rowIndex) {
		confirmDelete([rowIndex],function() {
			page_item.deleteRecord(fsParams);
		});
	},
	deleteRecord : function(fsParams) {
		startWaiting();
		jQuery.ajax({
			url: "page_item/page_item_de_c.jsp",
			type: "POST",
			data: "fsAction=delete&fsDatatype=json&cdcode="+fsParams[0],
			dataType: "html",
			contentType: defaultContentType,
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				stopWaiting();
				fssearchform.fsPage.value = fslistform.fsPage.value;
				page_item.search();
			}
		});
	},
	submitView : function(rowIndex,fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_item/page_item_view_c.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: "fsAjax=true&fsAction=retrieve&fsDatatype=text&cdcode="+fsParams[0],
			dataType: "html",
			error : function(transport,status,errorThrown) { 
				submitFailure(transport,status,errorThrown);  
			},
			success: function(data,status,transport){ 
				stopWaiting();
				$("#pageremainder").html(data);
				page_item.view();
			}
		});
	}
});
