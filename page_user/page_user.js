var page_user = $.extend({},base,{
	title: "My User",
	init: function(setting) { 
		page_user.setupComponents();
	},
	setupComponents : function() {
		$("#pageremainder").append($("#userinfopanel"));
		$("#searchbutton").click(function() { 
			page_user.search();
			return false;
		});
	},
	clearingFields : function() {
		page_user_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_user.clearingFields();
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
			url: "page_user/page_user_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				page_user.searchComplete(transport,data);
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
		placeholder = fs_getLabelName("usertnames_placeholder",fs_currentpid,lang);
		if(placeholder) $("#usertnames").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("usertsurnames_placeholder",fs_currentpid,lang);
		if(placeholder) $("#usertsurnames").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("emails_placeholder",fs_currentpid,lang);
		if(placeholder) $("#emails").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("mobiles_placeholder",fs_currentpid,lang);
		if(placeholder) $("#mobiles").attr("placeholder",placeholder);
	},
	submitRetrieve : function(rowIndex,fsParams) {
		var aform = fslistform;
		aform.userid.value = fsParams[0];
		aform.fromdate.value = fsParams[1];
		aform.todate.value = fsParams[1];
		//if(!confirm($(aform).serialize())) return false;
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_user/page_user_journal_c.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: $(aform).serialize(),
			dataType: "html",
			error : function(transport,status,errorThrown) { 
				submitFailure(transport,status,errorThrown);  
			},
			success: function(data,status,transport){ 
				stopWaiting();
				$("#journallistpanel").html(data);
				$("#journallistpanel").show();
				$("#listpanel").hide();
				$("#itemlistpanel").hide();
			}
		});
	},	
	submitChapter : function(aform,index) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_user/page_user_cp.jsp",
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
			url: "page_user/page_user_cd.jsp",
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
	submitView : function(rowIndex,fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_user/page_user_info_c.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: "fsAjax=true&fsAction=retrieve&fsDatatype=text&userid="+fsParams[0],
			dataType: "html",
			error : function(transport,status,errorThrown) { 
				submitFailure(transport,status,errorThrown);  
			},
			success: function(data,status,transport){ 
				stopWaiting();
				$("#userinfopanel").html(data);
				$("#page_user_info").modal("show");
			}
		});
	}
});
function backToListing() {
	$("#listpanel").show();
	$("#journallistpanel").hide();
	$("#itemlistpanel").hide();
	return false;
}
function backToJournal() {
	$("#journallistpanel").show();
	$("#listpanel").hide();
	$("#itemlistpanel").hide();
	return false;
}
function submitJournalChapter(aform,index) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_user/page_user_journal_cp.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: $(aform).serialize(),
			dataType: "html",
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				stopWaiting();
				$("#journallistpanel").html(data);
			}
		});
}
function submitJournalOrder(fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_user/page_user_journal_cd.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: fsParams,
			dataType: "html",
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				stopWaiting();
				$("#journallistpanel").html(data);
			}
		});
		return false;
}
