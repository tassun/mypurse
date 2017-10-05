<?xml version="1.0" encoding="TIS-620" ?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.fs.bean.misc.*" %>
<%@ page import="com.fs.bean.util.*" %>
<%
	String type = PageUtility.getParameter(request,"type");
	String sql = PageUtility.getParameter(request,"sql");
	String section = PageUtility.getParameter(request,"section");
	StringBuffer result = new StringBuffer();
	int isz = 0;
	int maxreq = 0;
	if((type!=null) && type.equals("reset")) {
		DBConnection.reset(section);
		maxreq = DBConnection.getMaxRequest(section);
		ConnectionPoolable pool = DBConnection.getPool(section);
		if(pool!=null) isz = pool.getMaxActive();
		result.append("<body>Connections reset</body>\n");
	} else if((type!=null) && type.equals("expire")) {
		DBConnection.expire(section);
		maxreq = DBConnection.getMaxRequest(section);
		ConnectionPoolable pool = DBConnection.getPool(section);
		if(pool!=null) isz = pool.getMaxActive();
		result.append("<body>Connections expire</body>\n");
	} else if(type!=null && type.equals("down")) {
		ConnectionPoolable pool = DBConnection.getPool(section);
		System.out.println("pool : "+pool);
		if(pool!=null) {
			pool.clear();
		}
		result.append("<body>Connections clear</body>\n");
	} else {
		java.util.Iterator dblist = DBConnection.iterator(section);
		if(dblist!=null) {
			synchronized(dblist) {
				maxreq = DBConnection.getMaxRequest(section);
				for(;dblist.hasNext();) {
					isz++;
					java.sql.Connection conn = (java.sql.Connection)dblist.next();
					System.out.println(isz+" . "+conn);
					result.append("<connection>\n");
					result.append("<name>"+conn+"</name>\n");
					result.append("<status>");
					if(conn!=null) {
						try {
							System.out.print("verify connection closed ...");
							boolean closed = conn.isClosed();
							if(closed) {
								result.append("closed");
							} else {
								result.append("active");
							}
							System.out.println("verify connection commited ...");
							conn.setAutoCommit(false);
					} catch(Exception ex) {
						ex.printStackTrace();
						result.append("error");
						result.append("<remark>"+ex.getMessage()+"</remark>");
					}
					result.append("</status>\n");
					if((sql!=null) && !sql.equals("")) {
						try {
							java.sql.Statement stm = conn.createStatement();
							stm.executeQuery(sql);
							result.append("<sql>success</sql>");
						} catch(Exception ex) {
							ex.printStackTrace();
							result.append("<sql>"+ex.getMessage()+"</sql>");
						}
					}
				} else {
				}
				result.append("</connection>\n");
			}
		}	
	}
}
%>
<message type="result" section="<%=section%>" connections="<%=isz%>" maxrequest="<%=maxreq%>" sql="<%=sql%>">
	<%=result.toString()%>
</message>
