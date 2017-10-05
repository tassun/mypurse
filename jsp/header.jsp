<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<% 
	String fs_favorite_url = (String)GlobalVariable.getVariable("FAVORITE_URL");
	if(fs_favorite_url==null) fs_favorite_url = "";
	String fs_default_language = com.fs.bean.util.PageUtility.getDefaultLanguage(request);
	String titleStyle = (String)GlobalVariable.getVariable("PROGRAM_TITLE_STYLE");
	if(titleStyle==null || titleStyle.equals("")) titleStyle = "F";
	boolean staticFlag = titleStyle.indexOf("S")>=0;
	boolean headFlag = titleStyle.indexOf("H")>=0;
	boolean floatFlag = titleStyle.indexOf("F")>=0;
	String progname = (String)session.getAttribute("progname"); 
	if((progname==null) || progname.trim().equals("")) progname = "SMART System";
	String progid = (String)session.getAttribute("progid"); 
	if((progid==null) || progid.trim().equals("")) progid = "";
	String progversion = (String)session.getAttribute("progrelease"); 
	if((progversion==null) || progversion.trim().equals("")) {
		progversion = "";
	} else { 
		//verify version in format $Revision: 1.00 $
		int idx = progversion.indexOf(" ");
		if(idx>0) {
			progversion = progversion.substring(idx+1);
			idx = progversion.indexOf(" ");
			if(idx>0) progversion = progversion.substring(0,idx);
			progversion = "v"+progversion;
		} else progversion = "v1.00";
	}
	String csrcsversion = (String)session.getAttribute("progversion"); 
	if((csrcsversion!=null) && !csrcsversion.trim().equals("")) {
		//verify version in format $Revision: 1.00 $
		int idx = csrcsversion.indexOf(" ");
		if(idx>0) {
			csrcsversion = csrcsversion.substring(idx+1);
			idx = csrcsversion.indexOf(" ");
			if(idx>0) csrcsversion = csrcsversion.substring(0,idx);
		} else csrcsversion = "1.00";
	}
	try {
		String projectpath = request.getSession().getServletContext().getRealPath("");
		String verfile = projectpath+java.io.File.separator+progid+java.io.File.separator+progid+".ver";
		java.io.File file = new java.io.File(verfile);
		if(!file.exists()) {
			verfile = projectpath+java.io.File.separator+progid.toUpperCase()+java.io.File.separator+progid+".ver";
			file = new java.io.File(verfile);
		}
		if(file.exists()) {
			java.io.FileInputStream fin = new java.io.FileInputStream(file);
			java.io.BufferedReader br = new java.io.BufferedReader(new java.io.InputStreamReader(fin));
			com.fs.dev.version.VersionKey vk = new com.fs.dev.version.VersionKey();
			String line = br.readLine();
			while(line!=null) {
				String sccs = vk.getContents(line);
				if(sccs!=null) {
					csrcsversion = vk.getRevision(sccs);
					if(sccs.equals(csrcsversion)) {
						csrcsversion = "1.00";
					}
					break;
				}
				line = br.readLine();
			}
			br.close();
		}
	} catch(Exception ex) { 
		ex.printStackTrace();
	}
	if((csrcsversion!=null) && !csrcsversion.trim().equals("")) {
		progversion = progversion+"("+csrcsversion+")";
	}
	String fs_accessorId = fsAccessor.getFsUser();
	if(fs_accessorId==null) fs_accessorId = "";
	String fs_accessorBranch = fsAccessor.getFsBranch();
	if(fs_accessorBranch==null) fs_accessorBranch = "";
	int fs_accessorAuthLevel = fsAccessor.getFsAuthlevel();
	String fs_accessorDate = fsAccessor.getFsDate();
	if(fs_accessorDate==null) fs_accessorDate = "";
	String progtitle = progname+"&nbsp;&nbsp;&nbsp;"+progid.toUpperCase()+"&nbsp;"+progversion+"&nbsp;";
	String fs_langs = "";
	StringBuffer fs_langbuf = new StringBuffer();
	boolean fs_displayLangFlag = true;
	String fs_displayLanguage = (String)GlobalVariable.getVariable("DISPLAY_HEADER_LANGUAGE");
	if((fs_displayLanguage!=null) && fs_displayLanguage.equalsIgnoreCase("false")) fs_displayLangFlag = false;
	if(fs_displayLangFlag) {
		fs_langs = (String)session.getAttribute("program_languages"); 
		if(fs_langs==null) fs_langs = "";
		//System.out.println("programing languages : "+fs_langs);
		if(fs_langs!=null && !fs_langs.trim().equals("")) {
			java.util.StringTokenizer token = new java.util.StringTokenizer(fs_langs,",");
			for(;token.hasMoreTokens();) {
				String fs_langKey = token.nextToken();
				if(!fs_langbuf.toString().equals("")) fs_langbuf.append("|");
				fs_langbuf.append("<a href=\"javascript:void(0)\" class=\"fslangclass\" ondragstart=\"return false;\" onclick=\"if(this.disabled) return; fs_switchLanguage('"+fs_langKey+"')\">"+fs_langKey+"</a>");
			}
		}
	}
	boolean fs_showProduct = true;
	String fs_displayProduct = (String)GlobalVariable.getVariable("DISPLAY_PRODUCT_LOGO");
	if((fs_displayProduct!=null) && fs_displayProduct.equalsIgnoreCase("false")) fs_showProduct = false;
	String displaySwitcher = ""; //"display:none;";
	String showThemeswitcher = (String)GlobalVariable.getVariable("SHOW_THEME_SWITCHER");
	if((showThemeswitcher!=null) && showThemeswitcher.equalsIgnoreCase("true")) { displaySwitcher = ""; }
	String showtitle = (String)GlobalVariable.getVariable("SHOW_TITLE");
	if((showtitle!=null) && showtitle.equalsIgnoreCase("false")) {
	} else {
%>
<table cellpadding="0" cellspacing="0" id="main_Tb" width="100%">
  <td align="center"><img src="../images/title.jpg" width="100%" height="95"></td>
</table>
<%}%>
<table width="100%" border="0"><tr><td align="right" valign="right"><div id="fsswitcher" style="<%=displaySwitcher%>"></div></td></table>
<%if(floatFlag) {%>
<DIV id="floatmenu" style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 0px solid; DISPLAY: none; Z-INDEX: 1; LEFT: 0px; VISIBILITY: visible; BORDER-LEFT: #000000 0px solid; BORDER-BOTTOM: #000000 0px solid; POSITION: absolute; TOP: 0px; HEIGHT: 180px">
	<table border="0" cellpadding="0" cellspacing="0" align='right' ><tr><td  nowrap><label id="proglabel" class="proglabelclass">		
	<A href="#0" onclick="if(this.disabled) return; handleFavor('<%=progid%>','<%=progname%>')" style="text-decoration:none; color: navy; font-weight: bold;" class="floatlinkclass programfavorclass ignoredisabled">&reg;</A>&nbsp;
	<A href="#0" class="programtitleclass ignoredisabled" onclick="if(this.disabled) return; openVersion('<%=progid%>')"><%=progtitle%></A>&nbsp;<%if(fs_displayLangFlag  && !fs_langbuf.toString().equals("")) { out.print(fs_langbuf.toString()+"&nbsp;"); 	} %>
	<A onclick="if(this.disabled) return; this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode); return false;" href="#0" class="closelinkclass ignoredisabled">x</A>
		<div id="FS_USER" style="display:none;"><%=fs_accessorId%></div>
		<div id="FS_BRANCH" style="display:none;"><%=fs_accessorBranch%></div>
		<div id="FS_AUTH" style="display:none;"><%=fs_accessorAuthLevel%></div>
		<div id="FS_DATE" style="display:none;"><%=fs_accessorDate%></div>
	</label></td></tr></table>
</DIV>
<%if(!staticFlag && fs_showProduct) {%>
<TABLE width="100%" cellpadding="0" cellspacing="0" class="ui-state-default"  border="0">
<!--<TABLE cellpadding="0" cellspacing="0" class="tclass  ui-state-active"  border="0">-->
  <TR class='subheadfirst'>
  <TD><!--<img id="productLogoImage" src="../images/product_logo.gif" >--></TD>
</TR>
</TABLE>
<%}%>
<%}%>
<%if(staticFlag) {%>
<TABLE width="100%" cellpadding="0" cellspacing="0" class="ui-state-default"  border="0">
<!--<TABLE cellpadding="0" cellspacing="0" class="tclass  ui-state-active"  border="0">-->
  <TR class='subheadfirst'>
<%if(fs_showProduct) { %>
	<TD><!--<img id="productLogoImage" src="../images/product_logo.gif" >--></TD>
<%} else { %>
	<td width="40%" >&nbsp;</td>
<%}%>
	<td>
	<table border="0" cellpadding="0" cellspacing="0" align='right' class="ui-widget-title"><tr><td align="right" nowrap><label id="floatlabel" class="floatlabelclass">		
	<A href="#0" class="programtitleclass staticlinkclass ignoredisabled" onclick="if(this.disabled) return; openVersion('<%=progid%>')"><%=progtitle%></A>&nbsp;<A href="#0" onclick="if(this.disabled) return; handleFavor('<%=progid%>','<%=progname%>')" style="text-decoration:none; color: navy; font-weight: bold;" class="staticlinkclass programfavorclass ignoredisabled">&reg;</A><%if(fs_displayLangFlag && !fs_langbuf.toString().equals("")) { out.print("&nbsp;"+fs_langbuf.toString()); 	} %>
		<div id="FS_USER" style="display:none;"><%=fs_accessorId%></div>
		<div id="FS_BRANCH" style="display:none;"><%=fs_accessorBranch%></div>
		<div id="FS_AUTH" style="display:none;"><%=fs_accessorAuthLevel%></div>
		<div id="FS_DATE" style="display:none;"><%=fs_accessorDate%></div>
	</label></td></tr></table>
	</TD>
</TR>
</TABLE>
<%}%>
<%if(!staticFlag && !floatFlag && fs_showProduct) {%>
<TABLE width="100%" cellpadding="0" cellspacing="0" class="ui-state-default"  border="0">
<!--<TABLE cellpadding="0" cellspacing="0" class="tclass  ui-state-active"  border="0">-->
  <TR class='subheadfirst'>
  <TD><!--<img id="productLogoImage" src="../images/product_logo.gif" >--></TD>
</TR>
</TABLE>
<%}%>
<script language="JavaScript">
fs_favorite_url = '<%=fs_favorite_url%>';
fs_default_language = '<%=fs_default_language%>';
fs_accessor = <%=fsAccessor.toJSON(null)%>;
<%if(floatFlag) {%>
FloatTopDiv();
<%}%>
<%if(headFlag) {%>
displayProgramTitle("<%=progtitle%>","<%=progid%>","<%=progname%>","<%=fs_langs%>",self);
<%}%>
</script>
