<?xml version="1.0" encoding="UTF-8" ?>
<%@ page isErrorPage="true" %>
<message type="error">
<body>
<%if(exception!=null && exception.getMessage()!=null && !exception.getMessage().equals("")) {%>
<%=com.fs.bean.util.BeanUtility.preserveXML(exception.getMessage())%>
<%}else{ String fs_exception = exception==null?"":""+exception;  %>
<%=com.fs.bean.util.BeanUtility.preserveXML(fs_exception)%>
<%}%>
</body>
</message>
