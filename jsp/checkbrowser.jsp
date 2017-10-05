<%
String fs_forwarder = "/version.jsp";
com.fs.dev.util.BrowserAgent agent = new com.fs.dev.util.BrowserAgent(request);
if(agent.isMSIE() && agent.isVersionLessThan("9.0")) {
	RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
	rd.forward(request,response); return;
} else if(agent.isChrome() && agent.isVersionLessThan("17.0")) {
	RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
	rd.forward(request,response); return;
} else if(agent.isFireFox() && agent.isVersionLessThan("10.0")) {
	RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
	rd.forward(request,response); return;
} else if(agent.isOpera() && agent.isVersionLessThan("11.0")) {
	RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
	rd.forward(request,response); return;
} else if(agent.isSafari() && agent.isVersionLessThan("5.1")) {
	RequestDispatcher rd = application.getRequestDispatcher(fs_forwarder);
	rd.forward(request,response); return;
}
%>