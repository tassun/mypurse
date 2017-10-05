<%@ page isErrorPage="true" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.bean.util.*" %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="request" class="com.fs.bean.util.GlobalBean"/>
<jsp:setProperty name="fsGlobal" property="*"/>
<%
	String errorMessage = PageUtility.getParameter(request,"message");
	if((errorMessage==null) || errorMessage.trim().equals("")) errorMessage = "General Protection Error Occured";
	if(exception!=null) exception.printStackTrace();
	response.setStatus(400,errorMessage);
	if(fsGlobal.isAjax()) {
		fsGlobal.setThrowable(exception);
		fsGlobal.createResponseStatus(out, response);
		return;
	}
%>
<html>
<head>
<title>Error</title>
</head>
<body style="background-color: whitesmoke;">
<br></br><br></br>
<center>
<font color="red" size="4">
<%=errorMessage%>
</font>
</center>
<br></br>
<div id="errorlayer" style="text-align:center;">
<%if(exception!=null && exception.getMessage()!=null && !exception.getMessage().equals("")) { %>
<%=BeanUtility.preserveXML(exception.getMessage())%>
<%}else{ String fs_exception = exception==null?"":""+exception; %>
<%=BeanUtility.preserveXML(fs_exception)%>
<%}%>
</div>
<br></br>
</body>
</html>