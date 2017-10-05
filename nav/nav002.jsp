<%@ page info="SCCS id: $Id$"%>
<%@ page errorPage="/jsp/errorpage.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fs.bean.gener.*"%>
<%@ page import="com.fs.bean.util.*"%>
<%@ page import="com.fs.bean.misc.*"%>
<%@ page import="com.fs.bean.*" %>
<%@ taglib uri="/WEB-INF/taglibs-formcontrol.tld" prefix="fs"%>
<%session.setAttribute("progname","Customer Lookup");%>
<%session.setAttribute("progid","nav002");%>
<%session.setAttribute("progversion","$Revision$");%>
<%if(request.getParameter("clear")!=null) {
	session.removeAttribute("fsGlobal"); 
}%>
<%!
//#it's strong enough to break into another method here
//#(5000) programmer code begin;
//#(5000) programmer code end;
%>
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Customer Lookup</title>
<%=PageUtility.createStyles("NAV_STYLE_FILE","../jquery/themes/base/jquery.ui.all.css,../jquery/themes/base/jquery-ui-1.8.2.custom.css,../flexigrid/css/flexigrid/flexigrid.css","nav002.css")%>
<%=PageUtility.createLinkStyles(fsAccessor)%>
<%
//#always be my styles
//#(15000) programmer code begin;
//#(15000) programmer code end;
%>
<%=PageUtility.createScripts("NAV_SCRIPT_FILE","../jquery/jquery-1.7.2.js,../jquery/ui/jquery.ui.core.js,../jquery/ui/jquery.ui.widget.js,../jquery/ui/jquery.ui.button.js,../jquery/ui/jquery.ui.position.js,../jquery/ui/jquery.ui.autocomplete.js,../jquery/js/jquery.ui.selectbox.js,../flexigrid/flexigrid.js,nav.js")%>
<script type="text/javascript">
	window.returnValue = "";
	var default_language = "<%=fs_lang%>";
	$(function() {
		var args = {};
		try { args = window.opener.getShowLookupDialogArguments(); }catch(ex) { 
			try { args = window.parent.getShowLookupDialogArguments(); } catch(exc) { }
		}
		var settings = jQuery.extend({
			dialogTitle : "Customer Lookup Dialog",
			//url: 'port.json',
			method : "POST",
			dataType: 'json',						
			columnModel : [
				{display: 'Customer ID', name : 'customer', width : 100, sortable : true, align: 'center', textalign: 'center'},
				{display: 'Local Name', name : 'lname', width : 120, sortable : true, align: 'center', textalign:'left'},
				{display: 'Local  Surname', name : 'lsurname', width : 120, sortable : true, align: 'center', textalign:'left' },
				{display: 'English Name', name : 'ename', width : 120, sortable : true, align: 'center', textalign:'left'},
				{display: 'English Surname', name : 'esurname', width : 120, sortable : true, align: 'center', textalign:'left' },
				{display: 'Card ID', name : 'cardid', width : 100, sortable : true, align: 'center', textalign:'left' }
				],			
			usepager: true,
			customizeColumn : true, 
			singleSelect : true,
			mapping : function(index,data,rowIndex) {
					if(index<0) return rowIndex;
					return data;
				},
			onSelect : function(index,data) {
				if(settings.singleSelect) {
					data["language"] = default_language;
					try { window.opener.afterShowLookupDialog(data); }catch(ex) { 
						try { window.parent.afterShowLookupDialog(data); }catch(exc) { }
					}
				}
			},
			onSelecting : function(data,selected,currow,container) {
				if(settings.singleSelect) return;
				$("input[type=checkbox]",currow).attr("checked",selected);
				var chooses = "";
				$("tbody tr",container).each(function(index,element) { 
					var tr = $(this);
					if(tr.is(".trSelected")) {
						var data = tr.data("cell");
						if(data) {
							if(chooses!="") chooses += ", ";
							chooses += data.cell[0];
						}
					}
				});
				$("#fieldselected").html(chooses);
			},
			onError : function(xhr) { alert(xhr.statusText); },
			useRp: true,
			rp: 15,
			showTableToggleBtn: true,
			width: 850,
			height: 200
		},args);
		var keepWidth = settings.dialogWidth;
		var keepHeight = settings.dialogHeight;
		window.document.title = settings.dialogTitle;
		if(settings.singleSelect) {
			$("#fieldselected_label").hide();
			$("#fieldselected").hide();
		} 
		else {
			settings = jQuery.extend(settings,{
				offset : 1,
				columnModel : [
					{ 
						display : '<input type="checkbox" value="C" id="ctrlbox" class="th-checkbox" style="height:13px;"></input>', 
						name : 'checkbox', 
						width : 40, 
						sortable : false, 
						align : 'center', 
						textalign : 'center', 
						editor : '<input type="checkbox" class="td-checkbox"></input>', 
						calling : 'click', 
						caller : function() { 
							var chk = $("#ctrlbox",$(this)).attr("checked");
							if(chk) {
								$("input.td-checkbox",$("#flextable")).each(function(index,element){ 
									$(this).attr("checked",true);
								}); 
								var chooses = "";
								$("tbody tr.flex-row",$("#flextable")).each(function(index,element){ 
									var tr = $(this);
									tr.addClass("trSelected"); 
									var data = tr.data("cell");
									if(data) {
										if(chooses!="") chooses += ", ";
										chooses += data.cell[0];
									}
								});
								$("#fieldselected").html(chooses);
							} else {
								$("input.td-checkbox",$("#flextable")).each(function(index,element){ 
									$(this).attr("checked",false);
								}); 
								$("tbody tr.flex-row",$("#flextable")).each(function(index,element){ $(this).removeClass("trSelected"); });
								$("#fieldselected").html("");
							}
						}, 
						binding : 'click', 
						binder : function() { $(this).parent().trigger("click"); }
					},					
					{display: 'Customer ID', name : 'customer', width : 100, sortable : true, align: 'center', textalign: 'center'},
					{display: 'Local Name', name : 'lname', width : 120, sortable : true, align: 'center', textalign:'left'},
					{display: 'Local  Surname', name : 'lsurname', width : 120, sortable : true, align: 'center', textalign:'left' },
					{display: 'English Name', name : 'ename', width : 120, sortable : true, align: 'center', textalign:'left'},
					{display: 'English Surname', name : 'esurname', width : 120, sortable : true, align: 'center', textalign:'left' },
					{display: 'Card ID', name : 'cardid', width : 100, sortable : true, align: 'center', textalign:'left' }
					]				
				});
		}
		$("#customerid").val(settings.query);
		if(settings.keys) {
			for(var p in settings.keys) {
				var fk = settings.keys[p];
				$("#"+fk.name).val(fk.value);
				if(fk.readonly) $("#"+fk.name).attr("readonly",true);
			}
		}
		$("#searchButton").button(	{ icons: { primary: "ui-icon-search" }, text: true}).click(function() { 
			$("#flextable").flexOptions({
					fetch : "true",
					url: "nav002_c.jsp", 
					params : $("#fslookupform").serialize(),
					method : "POST"
			});
			$("#flextable").flexReload();
		});
		$("#clearButton").button({ icons: { primary: "ui-icon-refresh" }, text: true}).click(function() { 
			$("input[type=text]",fslookupform).each(function(index,element) { $(this).val(""); });
			$("input[type=checkbox]",fslookupform).each(function(index,element) { $(this).attr("checked",false); });
		});
		$("#okButton").button({ icons: { primary: "ui-icon-check" }, text: true}).click(function(){
			var jsAry = $("#flextable").flexSelectData();
			jsAry["language"] = default_language;
			//window.returnValue = objectToString(jsAry); 
			//window.close(); 
			try { window.opener.afterShowLookupDialog(jsAry); }catch(ex) { }
		});
		$("#closeButton").button({ icons: { primary: "ui-icon-close" }, text: true}).click(function() { 
			//window.close();
			try { window.opener.closeLookupDialog(); }catch(ex) { }
		});
		$("#flextable").flexigrid(settings);
	});		
</script>
</head>
<body>
<form name="fslookupform" id="fslookupform">
<table cellspacing="0" id="fstable1" class="dettableclass detailclass  ui-state-default lookup-table-class">
<tbody id="fstablebody1">
	<tr>
		<td colspan="4">
			<input type="hidden" name="fsAction" class="iclass" value="collect"></input>
			<input type="hidden" name="fsAjax" class="iclass" value="true"></input>
			<input type="hidden" name="fsJson" class="iclass" value="true"></input>
			<input type="hidden" name="fsChapter" class="iclass" value="10"></input>
			<input type="hidden" name="fsPage" class="iclass" value="1"></input>
		</td>
	</tr>
	<tr class="rclass">
		<td class="lbclass"><label class="lclass" id="customerid_label" required="false">Customer ID</label></td>
		<td class="inclass">
			<input type="text" name="customerid" id="customerid" class="iclass"></input>
		</td>
		<td class="lbclass"><label class="lclass" id="carid_label" required="false">Card ID</label></td>
		<td class="inclass">
			<input type="text" name="cardid" id="cardid" class="iclass"></input>
		</td>
	</tr>
	<tr class="rclass">
		<td class="lbclass"><label class="lclass" id="lname_label" required="false">Local Name</label></td>
		<td class="inclass">
			<input type="text" name="lname" id="lname" class="iclass" size="40"></input>
		</td>
		<td class="lbclass"><label class="lclass" id="lsurname_label" required="false">Local Surname</label></td>
		<td class="inclass">
			<input type="text" name="lsurname" id="lsurname" class="iclass" size="40"></input>
		</td>
	</tr>
	<tr class="rclass">
		<td class="lbclass"><label class="lclass" id="ename_label" required="false">English Name</label></td>
		<td class="inclass">
			<input type="text" name="ename" id="ename" class="iclass" size="40"></input>
		</td>
		<td class="lbclass"><label class="lclass" id="esurname_label" required="false">English Surname</label></td>
		<td class="inclass">
			<input type="text" name="esurname" id="esurname" class="iclass" size="40"></input>
		</td>
	</tr>
	<tr>
		<td colspan="4">
		<table width="100%">
			<tr>
				<td width="3">&nbsp;</td>
				<td width="500">
					<fieldset class="fsclass ui-fieldset-class ui-fsclass option-fieldset-class">
						<legend class="ui-legend-class"><label class="lclass" id="searchoptoin_legend_label" pid="swpo001" required="false">Search Options</label></legend>
						<table cellspacing="0" id="fstable_searchoption" border="0" class="item-table-class">
							<tbody>
								<tr class="frclass">
									<td class="unwrap-column inclass"><input type="radio" name="searchoption" value="P" checked="true">Match Prefix</input></td>
									<td class="unwrap-column inclass"><input type="radio" name="searchoption" value="S">Match Suffix</input></td>
									<td class="unwrap-column inclass"><input type="radio" name="searchoption" value="H" >Whole Word Only</input></td>
								</tr>
							</tbody>
						</table>
					</fieldset>			
				</td>
				<td width="20">&nbsp;</td>
				<td>
					<table cellspacing="0" class="button-table-class">
						<tr class="entryrowclass">
							<td class="entrycolclass" align="right">
								<input type="button" name="searchButton" id="searchButton" class="ui-button-default buttonsearch" value="Search"></input>
								<input type="button" name="clearButton" id="clearButton" class="ui-button-default buttonclear" value="Clear"></input>
							</td>
							<td width="5">&nbsp;</td>
						</tr>		
					</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</tbody>
</table>
</form>
<div style="height: 4px; width:100%;"></div>
<table cellspacing="0" id="fstable2" class="dettableclass detailclass  ui-state-default control-table-class">
<tbody>
	<tr class="rclass" id="selectedrow">
		<td class="lbclass" width="80px"><label class="lclass" id="fieldselected_label" required="false" style="white-space: nowrap;">Selected : </label></td>
		<td>
			<table width="100%">
				<tr>
					<td>
					<span id="fieldselected" class="field-selected-class"></span>&nbsp;
					</td>
					<td align="right" id="ok-column-class" style="padding-right: 13px; white-space: nowrap;" width="200px;">
						<input type="button" name="okButton" id="okButton" class="ui-button-default buttonok" value="OK"></button>
						<input type="button" name="closeButton" id="closeButton" class="ui-button-default buttonclose" value="Close"></button>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</tbody>
</table>
<div style="height: 5px; width:100%;"></div>
<table id="flextable" style="display:none;" class="flexi-table-class"></table>
<div style="height: 5px; width:100%;"></div>
</body>
</html>
