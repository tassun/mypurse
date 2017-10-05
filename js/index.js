		var mouseX = 0;
		var mouseY = 0;
		var $currPage = "";
		var $previousApplication;
		var $currentApplication;
		var fs_working = true;		
		var msgdialog;
		var acceptdialog;
		function validInputUser() {
			if($.trim($("#login_user").val())=="") { alertbox("User is undefined"); return false; }
			return true;
		}
		function connectServer() {	
			if(!validInputUser()) return;
			//if(fs_working) { startWorking(); return; }
			login();
		}
		function disConnectServer(){
			logOut();
		}
		function login(){
			startWaiting();
			jQuery.ajax({
				url: "logon/logon_c.jsp",
				type: "POST",
				contentType: defaultContentType,
				data: $("#login_form").serialize(), 
				dataType: "html",
				error : function(transport,status,errorThrown) { 
					stopWaiting();
					errorThrow = parseErrorThrown(xhr, status, errorThrown);
					alertbox(errorThrown);
				},
				success: function(data,status,xhr){ 
					stopWaiting();
					var xmldoc = $.parseXML($.trim(data));
					var type = $("root",xmldoc).attr("type");
					if("error"==type) {
						alertbox($("body",xmldoc).text());
					} else {
						var fs_userdetail = $("fsUserName",xmldoc).text();
						$("#accessor_label").html(fs_userdetail);
						doAfterLogin(xmldoc);
					}
				}
			});			
		}
		function doAfterLogin(xmldoc) {
			startWorking();
			refreshScreen();
		}
		function startWorking() {
			$('#page_login').hide();
			createMenu(1); 
			startupPage(); 
			showMenu();
		}
		function createMenu(index){
			$("#homelayer").show();
			$("#mainmenu").show();
			$("#usermenuitem").show();
			$("#loginlayer").hide();
			$("#registerlayer").hide();
		}
		function startupPage(){
			load_page("page_first");
			load_sidebar_menu();
		}
		function showMenu(){
		}
		function hideMenu(){
			$("#page_first").hide();
		}
		function fs_changingPlaceholder(lang) {
			if(!lang) return;
			var placeholder = fs_getLabelName("login_user_placeholder","index",lang);
			if(placeholder) $("#login_user").attr("placeholder",placeholder);
			placeholder = fs_getLabelName("login_pass_placeholder","index",lang);
			if(placeholder) $("#login_pass").attr("placeholder",placeholder);
			var alabel = fs_getLabelName("login_label","index",lang);
			if(alabel) $("#login_label").html(alabel);
			alabel = fs_getLabelName("login_button","index",lang);
			if(alabel) $("#login_button").val(alabel);
			alabel = fs_getLabelName("forgot_password","index",lang);
			if(alabel) $("#forgot_password").html(alabel);
			alabel = fs_getLabelName("register_button","index",lang);
			if(alabel) $("#register_button").html(alabel);
			alabel = fs_getLabelName("profile_label","index",lang);
			if(alabel) $("#profile_label").html(alabel);
			alabel = fs_getLabelName("changepwd_label","index",lang);
			if(alabel) $("#changepwd_label").html(alabel);
			alabel = fs_getLabelName("logout_label","index",lang);
			if(alabel) $("#logout_label").html(alabel);
			alabel = fs_getLabelName("loginmenutrigger","index",lang);
			if(alabel) $("#loginmenutrigger").html(alabel);
			alabel = fs_getLabelName("registermenutrigger","index",lang);
			if(alabel) $("#registermenutrigger").html(alabel);
			alabel = fs_getLabelName("englishlanguage","index",lang);
			if(alabel) $("#englishlanguage").html(alabel);
			alabel = fs_getLabelName("thailanguage","index",lang);
			if(alabel) $("#thailanguage").html(alabel);
			alabel = fs_getLabelName("pagedaily_label","index",lang);
			if(alabel) $("#pagedaily_label").html(alabel);
			alabel = fs_getLabelName("pageitem_label","index",lang);
			if(alabel) $("#pageitem_label").html(alabel);
			alabel = fs_getLabelName("pagereport_label","index",lang);
			if(alabel) $("#pagereport_label").html(alabel);
			alabel = fs_getLabelName("pageuser_label","index",lang);
			if(alabel) $("#pageuser_label").html(alabel);
			alabel = fs_getLabelName("pagetrack_label","index",lang);
			if(alabel) $("#pagetrack_label").html(alabel);
			alabel = fs_getLabelName("pagelog_label","index",lang);
			if(alabel) $("#pagelog_label").html(alabel);
		}
		function goHome() {
			load_page("page_first");
		}
		function forceLogout() {
			$.ajax({ async: false, url : "logon/logout.jsp?seed="+Math.random(), type : "POST" });
		}
		function logOut() {
			try{ closeMenuBar(); }catch(ex) { }
			$("#pagecontainer").empty();
			$("#mainmenu").hide();
			if($currPage=="") $currPage = $("#page_first");
			if($currPage) {
				$currPage.removeClass('pt-page-current pt-page-moveFromRight pt-page-moveFromLeft');	
			}
			logInClick();
			$("#homelayer").hide();
			$("#mainmenu").hide();
			$("#usermenuitem").hide();
			$("#programtitle").html("MyPURSE");
			$("#loginlayer").show();
			$("#registerlayer").show();
			hideNewFavorItem();
			forceLogout();
		}
		function doLogin() {
			try{ closeMenuBar(); }catch(ex) { }
			$("#pagecontainer").empty();
			$("#mainmenu").hide();
			if($currPage=="") $currPage = $("#page_login");
			if($currPage) {
				$currPage.removeClass('pt-page-current pt-page-moveFromRight');	
			}
			logInClick();
			$("#homelayer").hide();
			$("#mainmenu").hide();
			$("#usermenuitem").hide();
			$("#programtitle").html("MyPURSE");
			$("#loginlayer").show();
			$("#registerlayer").show();
			hideNewFavorItem();
			fs_currentpid = "index";
		}
		function logInClick() {
			$("#page_login").addClass('pt-page-current pt-page-moveFromBottom');
			$("#page_login").show();
			login_form.reset();
		}
		function load_sidebar_menu() {
			var fs_user = $("#login_user").val();
			jQuery.get("main/side_menu.jsp?fsAjax=true&userid="+fs_user+"&seed="+Math.random(),function(data){ $("#sidebarlayer").html(data); bindingOnSideBarMenu(); });
		}
		function fs_changingLanguage(fs_Language) {
			try{ fs_changingPlaceholder(fs_Language); }catch(ex) { }
			if(fs_currentpid && fs_currentpid!="index") {
				fs_switchingLanguage(fs_Language,"index");
				if($currentApplication) $currentApplication.switchingLanguage(fs_Language);
			}
		}
		function refreshScreen() {
			$(window).trigger("resize");
		}
		function hideLoginForm() {
			$("#page_login").hide();
		}
		var mainapps = angular.module("mainapplication", []).controller("maincontroller", function($scope, $compile) {
				$scope.activateView = function(element) {
					$compile(element.contents())($scope);
					$scope.$apply();
				};
		});
		mainapps.config(function ($controllerProvider) {
            mainapps.controller = $controllerProvider.register;
        });
		$(function(){
			$(this).mousedown(function(e) { mouseX = e.pageX; mouseY = e.pageY; });
			msgdialog = createDialog("#fsdialoglayer");	
			acceptdialog = createDialog("#fsacceptlayer");
			try { startApplication("index",true); }catch(ex) { }
			//ignore force logout (it was invalidate session when refresh)
			//try { $(window).bind("unload",forceLogout); }catch(ex) { }
			$("#login_pass").on("keydown", function (e) {
				if(e.which==13) { connectServer(); }
			});
		});
		function registerClick() {
			hideLoginForm();
			open_page("page_regist");
		}
		function forgotClick() {
			hideLoginForm();
			open_page("page_forgot");
		}
		function profileClick() {
			open_page("page_profile");
		}
		function changeClick() {
			open_page("page_change");
		}
		function submitSearch(aform) {
			if($currentApplication) $currentApplication.submitSearch(aform);
		}
		function submitRetrieve(rowIndex,fsParams) {
			if($currentApplication) $currentApplication.submitRetrieve(rowIndex,fsParams);
		}
		function submitChapter(aform,index) {
			if($currentApplication) $currentApplication.submitChapter(aform,index);
		}
		function submitOrder(fsParams) {
			if($currentApplication) $currentApplication.submitOrder(fsParams);
		}
		function submitDelete(fsParams,rowIndex) {
			if($currentApplication) $currentApplication.submitDelete(fsParams,rowIndex);
		}
		function submitView(rowIndex,fsParams) {
			if($currentApplication) $currentApplication.submitView(rowIndex,fsParams);
		}
