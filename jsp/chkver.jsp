<%
	String classname = request.getParameter("class");
	if(classname==null || classname.trim().length()<=0) classname = "com.fs.Version";
	try {
		Class iiCls = Class.forName(classname);
		if (iiCls != null) {
			Object object = iiCls.newInstance();
			if(object instanceof com.fs.interfaces.VersionInterface) {
				com.fs.interfaces.VersionInterface ver = (com.fs.interfaces.VersionInterface) object;
				out.println(ver.fetchVersion());
			} else {
				out.println(classname+" is not implements com.fs.interfaces.VersionInterface class ...");
			}
		}
	}catch(Exception ex) {
		ex.printStackTrace();
		out.println(ex.toString());
	}
%>