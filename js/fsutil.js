var defaultContentType = "application/x-www-form-urlencoded; charset=UTF-8";
function change_page($nextPage){
	if($currPage==""){
		$currPage = $("#page_0");
	}
	$currPage.removeClass("pt-page-current pt-page-moveFromRight pt-page-moveFromLeft");
	$currPage = $nextPage.addClass("pt-page-current pt-page-moveFromRight");
}
function load_page(appid,params){	
	if($previousApplication) destroyApplication($previousApplication);
	if($currPage==""){
		$currPage = $("#page_0");
	}	
	$currPage.hide();
	$currPage.removeClass("pt-page-current pt-page-moveFromRight pt-page-moveFromLeft");	
	try{ closeMenuBar(); }catch(ex) { }
	loadApplication(appid,params);
	$("#pagecontainer").show();
}
function loadApplication(appid,params) {
	//alert("load app "+appid);
	$('#page_login').removeClass('pt-page-current');
	var fs_user = $("#login_user").val();
	if("page_daily"==appid) params = "cdrefdate="+getDateNow();
	//var appurl = appid+"/"+appid+".jsp?seed="+Math.random()+"&fsUser="+fs_user+(params?"&"+params:"");
	var appurl = appid+"/"+appid+".jsp?seed="+Math.random()+(params?"&"+params:"");
	startWaiting();
	jQuery.ajax({
		url: appurl,
		type: "POST",
		dataType: "html",
		contentType: defaultContentType,
		error : function(transport,status,errorThrown) { 
			stopWaiting();
			var txt = $.trim(transport.responseText);
			var $div = $("<div class='protection-error'></div>").html(txt);
			//if(transport.status==500 || txt=="") $div.addClass("protection-error-internal").html(errorThrown);
			//$div.addClass("protection-error-internal").html("General Protection Error Occured<br/>"+errorThrown);
			$("#pageremainder").empty();
			$("#pagesubremainder").empty();
			$("#pagecontainer").html($div);
		},
		success: function(data,status,transport){ 
			stopWaiting();
			$("#pageremainder").empty();
			$("#pagesubremainder").empty();
			$("#pagecontainer").html(data);
			applyApplicationView(appid,data);
			$currPage = $("#"+appid).addClass("pt-page-current pt-page-moveFromRight");
			try { onLoadPage(appid); } catch(ex) { }
			$currPage.show();
			initApplication(appid);
			$previousApplication = appid;
		}
	});	
}
function applyApplicationView(appid,data) {
	var appelement = angular.element(document.body);
	var appcontroller = angular.element(document.body);
	appcontroller.scope().activateView(appelement);
}
function initApplication(appid) {
	try { startApplication(appid,true); }catch(ex) { }
	try {
		var pid = eval(appid);
		pid.init({});
		initTitle(pid);
		$currentApplication = pid;
	}catch(ex) { }
}
function launchApplication(pid,appid) {
	try {
		if(!pid && appid) pid = eval(appid);
		pid.init({});
		initTitle(pid);
		$currentApplication = pid;
	}catch(ex) { }
}
function initTitle(pid) {
	var title = "MyPURSE";
	if(pid) title = pid.title;
	$("#programtitle").html(title);
}
function destroyApplication(appid) {
	try {
		if($currentApplication) {
			$currentApplication.destroy({}); 
			return;
		}
	}catch(ex)  {}
	try {
		var pid = eval(appid);
		pid.destroy({});
	}catch(ex) { }
}
function invokeProgram(appid) {
	try { startApplication(appid,true); }catch(ex) { }
	$('#page_login').removeClass('pt-page-current');
	var pager = $("#"+appid);
	pager.addClass("pt-page-current");	
	var pid = eval(appid);
	pid.init({});
	initTitle(pid);
	$currentApplication = pid;
}
function change_page_back($nextPage){
	if($currPage==""){
		$currPage = $("#page_0");
	}
	$currPage.removeClass("pt-page-current pt-page-moveFromRight pt-page-moveFromLeft");
	$currPage = $nextPage.addClass("pt-page-current pt-page-moveFromLeft");
}
function onLoadPage(page){
}
function onUnLoadPage(page){
}
function open_page(appid,params) {
	load_page(appid,params);
}
