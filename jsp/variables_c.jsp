<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=windows-874"%>
<%@ page import="com.fs.bean.util.*"%>
<%
	String action = PageUtility.getParameter(request,"action");
	String key = PageUtility.getParameter(request,"key");
	String value = PageUtility.getParameter(request,"value");
	if(action!=null) {
		if((key!=null) && (value!=null)) {
			GlobalVariable.setVariable(key,value);
		}
		String fs_forwarder = "/jsp/variables.jsp";
		RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
		rd.forward(request,response);
		return;
	}
%>
<html>
<meta http-equiv="content-type" content="text/html; charset=windows-874">
<title>Global Variables</title>
<head>
<link href="../CSS/fsstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<table border="1">
	<tr><th>Key</th><th>Value</th></tr>
		<form name="detform" method="post" action="variables_c.jsp">
		<tr>
		<input type="hidden" name="action" value="edit"></input>
		<input type="hidden" name="key" value="<%=key%>"></input>
		<td><%=key%></td>
		<td><input type="text" name="value" value="<%=value%>"></input></td>
		</tr>
		<tr>
		<td colspan="2" align="right">
			<input type="submit" name="submit" value="Submit"></input>
			<input type="reset" name="reset" value="Reset"></input>
		</td>
		</tr>
		</form>
</table>
</body>
</html>
