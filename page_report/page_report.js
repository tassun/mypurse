var page_report = $.extend({},base,{
	title: "My Report",
	init: function(setting) { 
		page_report.setupComponents();
	},
	setupComponents : function() {
		$("#journalbutton").click(function() { 
			page_report.search();
			return false;
		});
		$("#dailybutton").click(function() { 
			page_report.dailySearch();
			return false;
		});
		$("#monthlybutton").click(function() { 
			page_report.monthlySearch();
			return false;
		});
		$("#yearlybutton").click(function() { 
			page_report.yearlySearch();
			return false;
		});		
	},
	clearingFields : function() {
		page_report_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_report.clearingFields();
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
			url: "page_report/page_report_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				page_report.searchComplete(transport,data);
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
	},
	submitRetrieve : function(rowIndex,fsParams) {
		var aform = fslistform;
		aform.cdcode.value = fsParams[0];
		/*
		var paramAry = $(aform).serializeArray();
		$(paramAry).each(function(index,element) {
			if("fromdate"==element.name) {
				element.value = fsParams[1];
			} else if("todate"==element.name) {
				element.value = fsParams[2];
			}
		});
		var params = $.param(paramAry);
		*/
		//if(!confirm(params)) return false;
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_journal_c.jsp",
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
			url: "page_report/page_report_journal_cp.jsp",
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
	},
	submitOrder : function(fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_journal_cd.jsp",
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
	},
	submitView : function(rowIndex,fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_item_c.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: "fsAjax=true&fsAction=collect&fsDatatype=text&cdcode="+fsParams[0]+"&cdrefdate="+fsParams[1],
			dataType: "html",
			error : function(transport,status,errorThrown) { 
				submitFailure(transport,status,errorThrown);  
			},
			success: function(data,status,transport){ 
				stopWaiting();
				$("#itemlistpanel").html(data);
				$("#itemlistpanel").show();
				$("#listpanel").hide();
				$("#journallistpanel").hide();
			}
		});
	},
	dailySearch : function(aform) {
		if(!aform) aform = fssearchform;
		aform.fsAction.value = "collect";
		//if(!confirm($(aform).serialize())) return false;
		startWaiting();
		jQuery.ajax({
			url: "page_report/page_report_daily_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
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
	monthlySearch : function(aform) {
		if(!aform) aform = fssearchform;
		aform.fsAction.value = "retrieve";
		//if(!confirm($(aform).serialize())) return false;
		startWaiting();
		jQuery.ajax({
			url: "page_report/page_report_monthly_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
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
	yearlySearch : function(aform) {
		if(!aform) aform = fssearchform;
		aform.fsAction.value = "search";
		//if(!confirm($(aform).serialize())) return false;
		startWaiting();
		jQuery.ajax({
			url: "page_report/page_report_yearly_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
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
function submitViewDaily(rowIndex,fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_item_c.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: "fsAjax=true&fsAction=collect&fsDatatype=text&cdrefdate="+fsParams[0]+"&fromdate="+fsParams[1]+"&todate="+fsParams[2],
			dataType: "html",
			error : function(transport,status,errorThrown) { 
				submitFailure(transport,status,errorThrown);  
			},
			success: function(data,status,transport){ 
				stopWaiting();
				$("#itemlistpanel").html(data);
				$("#itemlistpanel").show();
				$("#listpanel").hide();
				$("#journallistpanel").hide();
			}
		});
}
function submitDailyChapter(aform,index) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_daily_cp.jsp",
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
function submitDailyOrder(fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_daily_cd.jsp",
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
function submitViewMonthly(rowIndex,fsParams) {
		var aform = fssearchform;
		aform.fsAction.value = "collect";
		/*
		var mm = fsParams[0];
		var yy = fsParams[1];
		var dd = getLastDayOfMonth(parseInt(mm)-1,yy);		
		var paramAry = $(aform).serializeArray();
		$(paramAry).each(function(index,element) {
			if("fromdate"==element.name) {
				element.value = "01/"+mm+"/"+yy;
			} else if("todate"==element.name) {
				element.value = dd+"/"+mm+"/"+yy;
			}
		});
		var params = $.param(paramAry);
		*/
		//if(!confirm(params)) return false;
		startWaiting();
		jQuery.ajax({
			url: "page_report/page_report_daily_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
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
}
function submitMonthlyChapter(aform,index) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_monthly_cp.jsp",
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
function submitMonthlyOrder(fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_monthly_cd.jsp",
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
function submitViewYearly(rowIndex,fsParams) {
		var aform = fssearchform;
		aform.fsAction.value = "retrieve";
		/*
		var yy = fsParams[0];
		var paramAry = $(aform).serializeArray();
		$(paramAry).each(function(index,element) {
			if("fromdate"==element.name) {
				element.value = "01/01/"+yy;
			} else if("todate"==element.name) {
				element.value = "31/12/"+yy;
			}
		});
		var params = $.param(paramAry);
		*/
		//if(!confirm(params)) return false;
		startWaiting();
		jQuery.ajax({
			url: "page_report/page_report_monthly_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
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
}
function submitYearlyChapter(aform,index) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_yearly_cp.jsp",
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
function submitYearlyOrder(fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_report/page_report_yearly_cd.jsp",
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
function exportReportJournalToExcel() {
	var fs_params = [
		{name: "reporttype", value: "excel"},
		{name: "fromdate", value: fslistform.fromdate.value},
		{name: "todate", value: fslistform.todate.value}
	];
	openNewWindow({ url: "page_report/page_report_export.jsp", windowName: "exportreportframe", params:  fs_params });
}
function exportReportJournalToPDF() {
	var fs_params = [
		{name: "reporttype", value: "pdf"},
		{name: "fromdate", value: fslistform.fromdate.value},
		{name: "todate", value: fslistform.todate.value}
	];
	openNewWindow({ url: "page_report/page_report_export.jsp", windowName: "exportreportframe", params:  fs_params });
}
function exportReportDailyToExcel() {
	var fs_params = [
		{name: "reporttype", value: "excel"},
		{name: "fromdate", value: fslistform.fromdate.value},
		{name: "todate", value: fslistform.todate.value}
	];
	openNewWindow({ url: "page_report/page_report_daily_export.jsp", windowName: "exportreportframe", params:  fs_params });
}
function exportReportDailyToPDF() {
	var fs_params = [
		{name: "reporttype", value: "pdf"},
		{name: "fromdate", value: fslistform.fromdate.value},
		{name: "todate", value: fslistform.todate.value}
	];
	openNewWindow({ url: "page_report/page_report_daily_export.jsp", windowName: "exportreportframe", params:  fs_params });
}
function exportReportMonthlyToExcel() {
	var fs_params = [
		{name: "reporttype", value: "excel"},
		{name: "fromdate", value: fslistform.fromdate.value},
		{name: "todate", value: fslistform.todate.value}
	];
	openNewWindow({ url: "page_report/page_report_monthly_export.jsp", windowName: "exportreportframe", params:  fs_params });
}
function exportReportMonthlyToPDF() {
	var fs_params = [
		{name: "reporttype", value: "pdf"},
		{name: "fromdate", value: fslistform.fromdate.value},
		{name: "todate", value: fslistform.todate.value}
	];
	openNewWindow({ url: "page_report/page_report_monthly_export.jsp", windowName: "exportreportframe", params:  fs_params });
}
function exportReportYearlyToExcel() {
	var fs_params = [
		{name: "reporttype", value: "excel"},
		{name: "fromdate", value: fslistform.fromdate.value},
		{name: "todate", value: fslistform.todate.value}
	];
	openNewWindow({ url: "page_report/page_report_yearly_export.jsp", windowName: "exportreportframe", params:  fs_params });
}
function exportReportYearlyToPDF() {
	var fs_params = [
		{name: "reporttype", value: "pdf"},
		{name: "fromdate", value: fslistform.fromdate.value},
		{name: "todate", value: fslistform.todate.value}
	];
	openNewWindow({ url: "page_report/page_report_yearly_export.jsp", windowName: "exportreportframe", params:  fs_params });
}