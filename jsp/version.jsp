<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=windows-874"%>
<%@ page import="com.fs.bean.util.*" %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<html>
<meta http-equiv="content-type" content="text/html; charset=windows-874">
<title>Version Information</title>
<head>
<link href="../css/fsstyle.css" rel="stylesheet" type="text/css">
<%=PageUtility.createLinkStyles(fsAccessor)%>
<%
	String progid = PageUtility.getParameter(request,"progid");
	if(progid==null) progid = (String)session.getAttribute("progid"); 
%>
</head>
<body>
	<%if(progid!=null) {%>
	<span style="font-weight:bold; text-align:left;"><%=progid.toUpperCase()%></span>
	<%}%>
	<table cellspacing="0" id="fstable1" class=""  border ='1' width="100%">
		<tbody id="fstablebody1">
			<tr class="rclass"><th>Program</th><th>Version</th></tr>
<%
	if(progid!=null) {
		String realpath = request.getSession().getServletContext().getRealPath("");
		String verfile = realpath+java.io.File.separator+progid+java.io.File.separator+progid+".ver";
		java.io.File vfile = new java.io.File(verfile);
		if(!vfile.exists()) {
			verfile = realpath+java.io.File.separator+progid.toUpperCase()+java.io.File.separator+progid+".ver";
			vfile = new java.io.File(verfile);
		}
		if(vfile.exists()) {
			System.out.println("Open version file "+verfile);
			java.io.FileInputStream fin = new java.io.FileInputStream(vfile);
			java.io.BufferedReader br = new java.io.BufferedReader(new java.io.InputStreamReader(fin));
			String line = br.readLine();
			while(line!=null) {
				int idx = line.indexOf("=");
				if(idx>=0) {
					String pid = line.substring(0,idx);
					String vid = line.substring(idx+1);
					out.println("<tr class=\"rclass\">");
					out.println("<td>"+pid+"</td><td align=\"center\">"+vid+"</td>");
					out.println("</tr>");
				}
				line = br.readLine();
			}
			br.close();
		} else {
			String dir = realpath+java.io.File.separator+progid;
			java.io.File[] files = null;
			java.io.File file = new java.io.File(dir);
			if(!file.exists()) {
				dir = realpath+java.io.File.separator+progid.toUpperCase();
				file = new java.io.File(dir);
			}
			System.out.println("Listing file on "+dir);
			if(file.exists()) {
				com.fs.dev.version.VersionListing vr = new com.fs.dev.version.VersionListing();
				vr.setPrinting(false);
				vr.addFolder(dir);
				java.util.Vector vlist = vr.execute(false);
				if(vlist!=null) {
					for(int i=0,isz=vlist.size();i<isz;i++) {
						String line = (String)vlist.elementAt(i);
						if(line!=null) {
							int idx = line.indexOf("=");
							if(idx>=0) {
								String pid = line.substring(0,idx);
								String vid = line.substring(idx+1);
								out.println("<tr class=\"rclass\">");
								out.println("<td>"+pid+"</td><td align=\"center\">"+vid+"</td>");
								out.println("</tr>");
							}
						}
					}
				}
			} else {
				out.println("<tr class=\"rclass\">");
				out.println("<td colspan=2>Program ID is undefined</d>");	
				out.println("</tr>");
			}
		}
	}
%>
		</tbody>
	</table>
	<br>
	<center>
		<input type="button" name="closeButton" value="Close" class="buttoncancel" onclick="window.close();"></input>
	</center>	
</body>
</html>
