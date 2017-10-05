var page_track = $.extend({},base,{
	title: "My Tracking",
	init: function(setting) { 
		page_track.setupComponents();
	},
	setupComponents : function() {
		$("#searchbutton").click(function() { 
			page_track.search();
			return false;
		});
	},
	clearingFields : function() {
		page_track_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_track.clearingFields();
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
			url: "page_track/page_track_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				page_track.searchComplete(transport,data);
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
	submitRetrieve : function(rowIndex,fsParams) {
		var aform = fslistform;
		aform.userid.value = fsParams[0];
		//if(!confirm(params)) return false;
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_track/page_track_journal_c.jsp",
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
			url: "page_track/page_track_cp.jsp",
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
			url: "page_track/page_track_cd.jsp",
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
			url: "page_track/page_track_c.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: "fsAjax=true&fsAction=collect&fsDatatype=text&fromdate="+fsParams[0]+"&todate="+fsParams[0],
			dataType: "html",
			error : function(transport,status,errorThrown) { 
				submitFailure(transport,status,errorThrown);  
			},
			success: function(data,status,transport){ 
				stopWaiting();
				$("#listpanel").html(data);
				$("#listpanel").show();
				$("#journallistpanel").hide();
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
			url: "page_track/page_track_journal_cp.jsp",
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
			url: "page_track/page_track_journal_cd.jsp",
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
