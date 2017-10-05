<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fs.bean.util.*"%>
<% com.fs.bean.util.PageUtility.initialPage(request,response); %>
<jsp:useBean id="fsAccessor" scope="session" class="com.fs.bean.util.AccessorBean"/>
<jsp:useBean id="fsGlobal" scope="session" class="com.fs.bean.util.GlobalBean"/>
<%
//#initialize & assignment always and forever
//#(10000) programmer code begin;
fsGlobal.obtain(session);
String fs_lang = fsGlobal.getFsLanguage();
if(fs_lang==null) fs_lang = "EN";
//#(10000) programmer code end;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Lookup Dialog</title>
<link href="../jquery/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
<link href="../jquery/themes/base/jquery-ui-1.8.2.custom.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/flexigrid/flexigrid.css">
<%=PageUtility.createLinkStyles(fsAccessor)%>
<%
//#always be my styles
//#(15000) programmer code begin;
//#(15000) programmer code end;
%>
<script type="text/javascript" src="../jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="flexigrid.js"></script>
<style>
	body { 	font-family: Arial, Helvetica, sans-serif; 	font-size: 12px; 	}		
	.flexigrid div.fbutton .add 	{ background: url(css/images/add.png) no-repeat center left; }	
	.flexigrid div.fbutton .delete 	{ background: url(css/images/close.png) no-repeat center left; }			
</style>
<script type="text/javascript">
function objectToString(o){    
    var parse = function(_o){    
        var a = [], t;        
        for(var p in _o){        
            if(_o.hasOwnProperty(p)){            
                t = _o[p];                
                if(t && typeof t == "object"){                
                    a[a.length]= "\""+p+"\"" + ":{ " + arguments.callee(t).join(", ") + "}";                    
                } else { 
                    if(typeof t == "string"){                    
                        a[a.length] = [ "\""+p+"\""+ ": \"" + t.toString() + "\"" ];
                    } else{
                        a[a.length] = [ "\""+p+"\""+ ": " + t.toString()];
                    }                    
                }
            }
        }        
        return a;        
    }    
    return "{" + parse(o).join(", ") + "}";    
}
$(function() {
	var args = {};
	try { args = window.parent.getShowLookupDialogArguments(); }catch(ex) { 
		try{ args = window.opener.getShowLookupDialogArguments(); } catch(es) { 
			try { args = window.dialogArguments; } catch(ea) { }
		}
	}
	var params = jQuery.extend({
		onSelect : function(index,data) { 
			data["language"] = "<%=fs_lang%>";
			try { window.parent.afterShowLookupDialog(data); }catch(ex) { 
				try { window.opener.afterShowLookupDialog(data); }catch(es) { 
					try { window.returnValue = objectToString(data); window.close(); }catch(ea) { }
				}
			}
		}
	},args);	
	window.document.title = params.dialogTitle;
	$("#flextable").flexigrid(params);		
});
</script>
</head>
<body>
<table id="flextable" style="display:none" class="tclass ui-state-default"></table>
</body>
</html>
