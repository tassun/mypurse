<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.setup.*"%>
<%session.putValue("progname","Global Variable Information");%>
<%session.putValue("progid","global");%>
<%session.putValue("progversion","$Revision$");%>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<%
	String action = PageUtility.getParameter(request,"action");
	String key = PageUtility.getParameter(request,"key");
	String value = PageUtility.getParameter(request,"value");
	String desc = PageUtility.getParameter(request,"desc");
	if(action!=null) {
		if(action.equals("insert")) {
			if((key!=null) && !key.trim().equals("") && (value!=null)) {
				GlobalVariable.setVariable(key,value);
				value = GlobalVariable.encryptVariable(key,value);
				String realpath = request.getSession().getServletContext().getRealPath("");
				String filename = realpath+java.io.File.separator+"global"+java.io.File.separator+"global_descriptor.xml";
				XMLFile xf = new XMLFile();
				java.net.URL url = xf.openResource("global_config.xml");
				xf.setProperty(key,value);
				xf.saveAs(url);
				if(desc!=null && !desc.trim().equals("")) {
					xf = new XMLFile();
					xf.open(filename);
					desc = BeanUtility.nativeToUnicode(desc);
					xf.setProperty(key,desc);
					xf.saveAs(filename);
				}			
			}
			String fs_forwarder = "/global/global.jsp";
			RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
			rd.forward(request,response);
			return;		
		} else if(action.equals("add")) {
		} else if(action.equals("cancel")) {
			String fs_forwarder = "/global/global.jsp";
			RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
			rd.forward(request,response);
			return;
		} else {
			if((key!=null) && (value!=null)) {
				GlobalVariable.setVariable(key,value);
				value = GlobalVariable.encryptVariable(key,value);	
				XMLFile xf = new XMLFile();
				java.net.URL url = xf.openResource("global_config.xml");
				xf.setProperty(key,value);
				xf.saveAs(url);			
			}
			String fs_forwarder = "/global/global.jsp";
			RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
			rd.forward(request,response);
			return;
		}
	}
	String initjs = "";
	if(action!=null && action.equals("add")) {
		initjs = "detform.key.focus()";
	} else {
		initjs = "detform.value.focus()";
	}
%>
<html>
<meta http-equiv="content-type" content="text/html; charset=windows-874">
<title>Global Variables</title>
<head>
<link href="../css/fsstyle.css" rel="stylesheet" type="text/css">
</head>
<body onload="<%=initjs%>">
<%@ include file = "/jsp/header.jsp"%>
<%if(action!=null && action.equals("add")) {%>
<table border="1">
	<tr><th>Key</th><th>Value</th><th>Description</th></tr>
		<form name="detform" method="post" action="global_c.jsp">
		<tr>
		<input type="hidden" name="action" value="insert"></input>
		<td><input type="text" name="key" value=""></input></td>
		<td><input type="text" name="value" value="" size="30"></input></td>
		<td><input type="text" name="desc" value="" size="50"></input></td>
		</tr>
		<tr>
		<td colspan="3" align="right">
			<input type="submit" name="submit" value="Submit"></input>
			<input type="reset" name="reset" value="Reset"></input>
			<input type="submit" name="resume" value="Resume" onclick="action.value='cancel'"></input>
		</td>
		</tr>
		</form>
</table>
<%} else {%>
<table border="1" width="100%">
	<tr><th>Key</th><th>Value</th></tr>
		<form name="detform" method="post" action="global_c.jsp">
		<tr>
			<input type="hidden" name="action" value="edit"></input>
			<input type="hidden" name="key" value="<%=key%>"></input>
			<td><%=key%></td>
			<td><input type="text" name="value" value="<%=value%>" size="30"></input></td>
		</tr>
		<tr>
		<td colspan="2" align="right">
			<input type="submit" name="submit" value="Submit"></input>
			<input type="reset" name="reset" value="Reset"></input>
			<input type="submit" name="resume" value="Resume" onclick="action.value='cancel'"></input>
		</td>
		</tr>
		</form>
</table>
<%}%>
</body>
</html>
