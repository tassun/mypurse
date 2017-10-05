<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<% com.fs.bean.util.PageUtility.initialPage(request,response); %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Cache-Control" content="no-store">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<title>MyPURSE</title>		
		<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon" />		
		<style>
			body {
				background-color: #FDF4D6;
			}
			.product-title { font-weight: bold; font-size: 36px; color: #5B460F }
			.sorry-title { font-size: 26px; color: #59460E; }
			.text { color: navy; }
			.wording {
				height: 350px;
				width: 800px;
				padding-top: 90px;
			}
		</style>
	</head>
	<body class="portalbody portalbody-off">
		<div align="center" style="margin-top: 50px">
		<table width="100%" height="100%" border="0">
			<tr>
				<td colspan="3" align="center">
					<span class="product-title">MyPURSE</span>
					<br/><br/>
					<span class="sorry-title">ต้องกราบขออภัย</span>
					<br/><br/>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center" valign="top" class="wording" style="background: url(img/back/wording.png) no-repeat center;">
				<p class="text">
					ท่านกำลังเข้าใช้งานเว็บไซต์ด้วยเว็บบราวเซอร์เวอร์ชั่นเก่า <br/>
      เพื่อการใช้งานอย่างสมบูรณ์  ขอแนะนำให้ท่านใช้เว็บบราวเซอร์ <br/>Chrome V.17+ / 
      Firefox V.10+ / Internet Explorer V.9+ / Opera V.11+ / Safari V.5+</p>
					<br/>
					<table cellspacing="3px" cellpadding="10px">
						<tr>
							<td><a href="http://windows.microsoft.com/th-th/internet-explorer/download-ie" target="_blank"><img src="img/web/ie.png" width="50px" height="50px" border="0" title="IE Download"/></a></td>
							<td><a href="http://www.google.co.th/intl/th/chrome/browser/" target="_blank"><img src="img/web/chrome.png" width="50px" height="50px" border="0" title="Chrome Download"/></a></td>
							<td><a href="https://www.mozilla.org/th/firefox/new/" target="_blank"><img src="img/web/firefox.png" width="50px" height="50px" border="0" title="FireFox Download"/></a></td>
							<td><a href="http://www.opera.com/th/download" target="_blank"><img src="img/web/opera.png" width="50px" height="50px" border="0" title="Opera Download"/></a></td>
							<td><a href="https://support.apple.com/downloads/safari" target="_blank"><img src="img/web/safari.png" width="50px" height="50px" border="0" title="Safari Download"/></a></td>
						</tr>
					</table>
					<br/>
					<P class="text">คลิกที่ไอคอนเพื่อเลือกดาวน์โหลดบราวเซอร์เวอร์ชั่นล่าสุด</P>
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		</div>
	</body>
</html>