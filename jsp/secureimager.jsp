<%@ page info="SCCS id: $Id$" %>
<%@ page contentType="image/png" trimDirectiveWhitespaces="true"%>
<%@ page import="com.fs.dev.misc.*" %>
<%
try {
	SecureImage image = new SecureImage(true); //true=using mathematical calculation
	image.setEffect(SecureImage.RANDOM_COLOR+SecureImage.RANDOM_LINE+SecureImage.RANDOM_FONT+SecureImage.RANDOM_STYLE);
	//image.setBackgroundEffect(SecureImage.BE_SQUARE+SecureImage.RANDOM_COLOR);
	//image.setBackgroundEffect(SecureImage.BE_OVAL+SecureImage.RANDOM_COLOR);
	image.setBackgroundEffect(SecureImage.RANDOM_COLOR);
	image.setBackgroundColor(java.awt.Color.white);
	image.setFontSize(24);
	image.setLength(6);
	image.drawImage(250,100);
	session.setAttribute("fsSecureImage",image.getImageTitle());
	image.render(response.getOutputStream());
} catch(Exception ex) {
	ex.printStackTrace();
}
%>
