<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.utils.*" %>
<%
	String progid = com.fs.bean.util.PageUtility.getParameter(request,"pid");
	if(progid!=null) {
		String xmlfile = progid;
		if(progid.indexOf(".xml")<0) {
			xmlfile = progid+".xml";
		}
		System.out.println("real path = "+request.getSession().getServletContext().getRealPath("/"));
		String tmppath = request.getSession().getServletContext().getRealPath("/")+java.io.File.separator+"tmp";
		java.io.File tfile = new java.io.File(tmppath);
		if(!tfile.exists()) tfile.mkdirs();
		String filepath = request.getSession().getServletContext().getRealPath("/")+java.io.File.separator+"WEB-INF"+java.io.File.separator+"classes"+java.io.File.separator;		
		String fullfilename = filepath + xmlfile;
		java.io.File file = new java.io.File(fullfilename);
		if(!file.exists()) {
			filepath = filepath + "META-INF"+java.io.File.separator;
			fullfilename = filepath + xmlfile;
		}
		System.out.println("label file = "+fullfilename);
		LabelConfig lconfig = null;
		java.io.File lfile = new java.io.File(fullfilename);
		if(lfile.exists()) {
			lconfig = new LabelConfig(fullfilename);
		} else {
			lconfig = new LabelConfig(xmlfile);
		}
		//lconfig.load();
		lconfig.reload();
		java.util.Map map = lconfig.getConfig();
		if(map==null || map.isEmpty()) {
			out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?><configs></configs>");
			return;
		} else {
			out.print(lconfig.toXML());
			return;
		}
	}
%>
<?xml version="1.0" encoding="UTF-8"?>
<configs></configs>
