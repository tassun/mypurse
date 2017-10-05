var page_log = $.extend({},base,{
	title: "My Logging",
	init: function(setting) { 
		page_log.setupComponents();
	},
	setupComponents : function() {
		$("#searchbutton").click(function() { 
			page_log.search();
			return false;
		});
	},
	clearingFields : function() {
		page_log_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_log.clearingFields();
		});
	},
	validForm : function() {
		var valid = true;
		return valid;
	},
	search : function(aform) {
		if(!aform) aform = fssearchform;
		aform.fsAction.value = "collect";
		startWaiting();
		jQuery.ajax({
			url: "page_log/page_log_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				page_log.searchComplete(transport,data);
			}
		});	
	},
	searchComplete : function(xhr,data) {
		stopWaiting();
		$("#itemlistpanel").hide();
		$("#journallistpanel").hide();
		$("#listpanel").show();
		$("#listpanel").html(data);
	},
	switchingLanguage : function(lang) {
		var placeholder = fs_getLabelName("userids_placeholder",fs_currentpid,lang);
		if(placeholder) $("#userids").attr("placeholder",placeholder);
	},
	submitChapter : function(aform,index) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_log/page_log_cp.jsp",
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
			url: "page_log/page_log_cd.jsp",
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
	}
});
