<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fs.bean.gener.*"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.bean.*" %>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<%session.setAttribute("progname","Lookup");%>
<%session.setAttribute("progid","nav003");%>
<%session.setAttribute("progversion","$Revision$");%>
<%if(request.getParameter("clear")!=null) {
	session.removeAttribute("fsGlobal"); 
}%>
<%!
//#it's strong enough to break into another method here
//#(5000) programmer code begin;
//#(5000) programmer code end;
%>
<% com.fs.bean.util.PageUtility.initialPage(request,response); %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="session" class="com.fs.bean.util.GlobalBean"/>
<%
//#initialize & assignment always and forever
//#(10000) programmer code begin;
fsGlobal.obtain(session);
String fs_lang = fsGlobal.getFsLanguage();
if(fs_lang==null) fs_lang = "EN";
//#(10000) programmer code end;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>User Lookup</title>
<%=PageUtility.createStyles("NAV_STYLE_FILE","../jquery/themes/base/jquery.ui.all.css,../jquery/themes/base/jquery-ui-1.8.2.custom.css,../flexigrid/css/flexigrid/flexigrid.css","nav003.css")%>
<%=PageUtility.createLinkStyles(fsAccessor)%>
<%
//#always be my styles
//#(15000) programmer code begin;
//#(15000) programmer code end;
%>
<%=PageUtility.createScripts("NAV_SCRIPT_FILE","../jquery/jquery-1.7.2.js,../jquery/ui/jquery.ui.core.js,../jquery/ui/jquery.ui.widget.js,../jquery/ui/jquery.ui.button.js,../jquery/ui/jquery.ui.position.js,../jquery/ui/jquery.ui.autocomplete.js,../jquery/js/jquery.ui.selectbox.js,../flexigrid/flexigrid.js,nav.js")%>
<script type="text/javascript">
	window.returnValue = "";
	var default_language = "<%=fs_lang%>";
	$(function() {
		var args = {};
		try { args = window.opener.getShowLookupDialogArguments(); }catch(ex) { 
			try { args = window.parent.getShowLookupDialogArguments(); } catch(exc) { }
		}
		var settings = jQuery.extend({
			dialogTitle : "User Lookup Dialog",
			//url: 'port.json',
			method : "POST",
			dataType: 'json',	
			columnModel : [
				{display: 'ID', name : 'userid', width : 100, sortable : true, align: 'center', textalign: 'center'},
				{display: 'Thai Name', name : 'usertname', width : 150, sortable : true, align: 'center', textalign:'left' },
				{display: 'Thai Surname', name : 'usertsurname', width : 150, sortable : true, align: 'center', textalign:'left'},
				{display: 'English Name', name : 'userename', width : 150, sortable : true, align: 'center', textalign:'left'},
				{display: 'English Surname', name : 'useresurname', width : 150, sortable : true, align: 'center', textalign:'left'}
				],					
			offset : 0,
			usepager: true,
			customizeColumn : true, 
			singleSelect : true,
			enable : true,
			onSelect : function(index,data) {
					data["language"] = default_language;
					try { window.opener.afterShowLookupDialog(data); }catch(ex) { 
						try { window.parent.afterShowLookupDialog(data); }catch(exc) { }
					}
			},
			onError : function(xhr) { alert(xhr.statusText); },
			useRp: true,
			rp: 15,
			showTableToggleBtn: true,
			width: 800,
			height: 200
		},args);
		var keepWidth = settings.dialogWidth;
		var keepHeight = settings.dialogHeight;
		window.document.title = settings.dialogTitle;
		if(settings.keys) {
			for(var p in settings.keys) {
				var fk = settings.keys[p];
				$("#"+fk.name).val(fk.value);
				if(fk.readonly) $("#"+fk.name).attr("readonly",true);
			}
		}
		$("#searchButton").button(	{ icons: { primary: "ui-icon-search" }, text: true}).click(function() { 
			$("#flextable").flexOptions({
					fetch : "true",
					url: "nav003_c.jsp", 
					params : $("#fslookupform").serialize(),
					method : "POST"
			});
			$("#flextable").flexReload();
			return false;
		});
		$("#clearButton").button({ icons: { primary: "ui-icon-refresh" }, text: true}).click(function() { 
			$("input[type=text]",fslookupform).each(function(index,element) { $(this).val(""); });
			$("input[type=checkbox]",fslookupform).each(function(index,element) { $(this).attr("checked",false); });
		});
		$("#flextable").flexigrid(settings);
		return false;
	});		
</script>
</head>
<body>
<form name="fslookupform" id="fslookupform">
<table cellspacing="0" id="fstable1" class="dettableclass detailclass  ui-state-default lookup-table-class">
<tbody id="fstablebody1">
	<tr>
		<td colspan="4">
			<input type="hidden" name="fsAction" class="iclass" value="collect"></input>
			<input type="hidden" name="fsAjax" class="iclass" value="true"></input>
			<input type="hidden" name="fsJson" class="iclass" value="true"></input>
			<input type="hidden" name="fsChapter" class="iclass" value="10"></input>
			<input type="hidden" name="fsPage" class="iclass" value="1"></input>
			<input type="hidden" name="usertype" id="usertype" class="iclass"></input>
		</td>
	</tr>
	<tr class="rclass">
		<td class="lbclass"><fs:label tagclass="lclass" tagid="userid_label" required="false" pid="nav003">ID</fs:label></td>
		<td class="inclass" colspan="3">
			<input type="text" name="userid" id="userid" class="iclass" size="30"></input>
		</td>
	</tr>
	<tr class="rclass">
		<td class="lbclass"><fs:label tagclass="lclass" tagid="usertname_label" required="false" pid="nav003">Thai Name</fs:label></td>
		<td class="inclass">
			<input type="text" name="usertname" id="usertname" class="iclass" size="30"></input>
		</td>
		<td class="lbclass"><fs:label tagclass="lclass" tagid="usertsurname_label" required="false" pid="nav003">Thai Surname</fs:label></td>
		<td class="inclass">
			<input type="text" name="usertsurname" id="usertsurname" class="iclass" size="30"></input>
		</td>
	</tr>
	<tr class="rclass">
		<td class="lbclass"><fs:label tagclass="lclass" tagid="userename_label" required="false" pid="nav003">English Name</fs:label></td>
		<td class="inclass">
			<input type="text" name="userename" id="userename" class="iclass" size="30"></input>
		</td>
		<td class="lbclass"><fs:label tagclass="lclass" tagid="useresurname_label" required="false" pid="nav003">English Surname</fs:label></td>
		<td class="inclass">
			<input type="text" name="useresurname" id="useresurname" class="iclass" size="30"></input>
		</td>
	</tr>
	<tr class="rclass">
		<td class="lbclass"><fs:label tagclass="lclass" tagid="email_label" required="false" pid="nav003">Email</fs:label></td>
		<td class="inclass">
			<input type="text" name="email" id="email" class="iclass" size="30"></input>
		</td>
		<td class="lbclass"><fs:label tagclass="lclass" tagid="mobile_label" required="false" pid="nav003">Mobile</fs:label></td>
		<td class="inclass">
			<input type="text" name="mobile" id="mobile" class="iclass" size="30"></input>
		</td>
	</tr>
	<tr>
		<td colspan="4">
		<table width="100%">
			<tr>
				<td width="20">&nbsp;</td>
				<td>
					<table cellspacing="0" class="button-table-class">
						<tr class="entryrowclass">
							<td class="entrycolclass" align="right">
								<input type="button" name="searchButton" id="searchButton" class="ui-button-default buttonsearch" value="Search"></input>
								<input type="button" name="clearButton" id="clearButton" class="ui-button-default buttonclear" value="Clear"></input>
							</td>
							<td width="5">&nbsp;</td>
						</tr>		
					</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</tbody>
</table>
</form>
<div style="height: 5px; width:100%;"></div>
<table id="flextable" style="display:none;" class="flexi-table-class"></table>
<div style="height: 5px; width:100%;"></div>
</body>
</html>
