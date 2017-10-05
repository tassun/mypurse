<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fs.bean.util.*"%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsPermission" scope="page" class="com.fs.bean.util.PermissionBean"/>
<jsp:setProperty name="fsPermission" property="*"/>
<%
	fsPermission.setProgram("global");
	fsAccessor.addPermission(fsPermission);
%>
<html>
<title>Global Variable Information</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<head>
<script language="JavaScript">
var fs_winary = new Array();
function getWindowByName(winname) {
	if(!winname) return null;
	var ex;
	for(var i=0,isz=fs_winary.length;i<isz;i++) {
		try	{
			if(fs_winary[i]) {
				if(fs_winary[i].name == winname) return fs_winary[i];
			}
		}catch (ex)	{ 	}
	}
	return null;
}
function closeChildWindows() {
	var ex;
	for(var i=0,isz=fs_winary.length;i<isz;i++) {
		try	{
			if(fs_winary[i]) fs_winary[i].close();
		}catch(ex) { }
	}
}
function addWindow(awindow) {
	if(!awindow) return;
	fs_winary.push(awindow);
}
//#script and function definition anything for you
//#(10000) programmer code begin;
//#(10000) programmer code end;
</script>
</head>
<frameset rows="0,*" id="theframe" frameborder="NO" border="0" framespacing="0">
  <frame src="global_h.html" name="headframe"></frame>
  <frame src="global.jsp?clear=true" name="mainframe"></frame>
</frameset>
<body>
</body>
</html>
