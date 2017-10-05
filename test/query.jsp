<%@ page errorPage="/jsp/errorpage.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="javax.naming.*" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Query</title>
 </head>
 <body>
<table border="1">
<%
	long t1 = System.currentTimeMillis();
	String sql = request.getParameter("sql");
	if(sql!=null && sql.trim().length()>0) {
		String section = request.getParameter("section");
		try {
			InitialContext context = new InitialContext();
			Context xmlContext = (Context) context.lookup("java:comp/env");
			javax.sql.DataSource ds = (javax.sql.DataSource)xmlContext.lookup("jdbc/MySQLDS");
			java.sql.Connection conn = ds.getConnection(); //DBConnection.getConnection(section);
			try {
				java.sql.Statement stm = conn.createStatement();
				java.sql.ResultSet rs = stm.executeQuery(sql);
				java.sql.ResultSetMetaData met =rs.getMetaData();
				out.print("<tr>");
				for(int i=0,isz=met.getColumnCount();i<isz;i++) {
					out.println("<th>"+met.getColumnName(i+1)+"</th>");
				}
				out.println("</tr>");
				while(rs.next()) {
					out.print("<tr>");
					for(int i=0,isz=met.getColumnCount();i<isz;i++) {
						String colname = met.getColumnName(i+1);
						out.print("<td>");
						out.print(rs.getString(colname));
						out.print("</td>");
					}
					out.println("</tr>");
				}
			} catch(Exception ex) {
				ex.printStackTrace();
				out.println("<tr><td>"+ex.getMessage()+"</td></tr>");
			} finally {
				conn.close();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			out.println("<tr><td>"+ex.getMessage()+"</td></tr>");
		}
	}
	long t2 = System.currentTimeMillis();
	System.out.println("response time "+t1+" - "+t2+" = "+(t2-t1));
%>
</table>
</body>
</html>