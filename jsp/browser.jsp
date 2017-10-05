<%@ page import="com.fs.dev.util.*"%>
<%
	BrowserAgent a = new BrowserAgent(request);
	System.out.println(a.getAgent());
	System.out.println("MSIE="+a.isMSIE()+", Chrome="+a.isChrome()+", FireFox="+a.isFireFox()+", Opera="+a.isOpera()+", Safari="+a.isSafari()+", Unknown="+a.isUnknown());
	System.out.println(a);
%>
<table border="1">
<tr><td colspan="2">Browser Agent Information</td></tr>
<tr><td>Agent</td><td><%=a.getAgent()%></td></tr>
<tr><td>Browser</td><td><%=a.getBrowserName()%></td></tr>
<tr><td>Version</td><td><%=a.getVersion()%></td></tr>
<tr><td>OS</td><td><%=a.getOSName()%></td></tr>
<tr><td>Type</td><td><%=a.getType()%></td></tr>
<tr><td>Major/Minor</td><td><%=a.getMajorVersion()%>/<%=a.getMinorVersion()%></td><tr>
<tr><td>Family</td><td><%=a.getFamily()%></td></tr>
<tr><td>Producer</td><td><%=a.getProducer()%></td></tr>
<tr><td>Device</td><td><%=a.getDevice()%></td></tr>
</table>
