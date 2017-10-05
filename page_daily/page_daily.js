var page_daily = $.extend({},base,{
	title: "My Daily List",
	init: function(setting) { 
		page_daily.setupComponents();
	},
	setupComponents : function() {
		$("#pageremainder").append($("#entrypanel"));
		$("#pagesubremainder").append($("#itementrypanel"));
		$("#insertbutton").click(function() { 
			page_daily.insert();
			return false;
		});
		$("#searchbutton").click(function() { 
			page_daily.search();
			return false;
		});
		$("#page_daily_savebutton").click(function() { 
			page_daily.save();
			return false;
		});
		$(".my-input").focus(function() { 
			$("#"+$(this).attr("id")+"_layer").removeClass("has-error");
			$("#"+$(this).attr("id")+"_alert").hide();
		}).blur(function() { 
			if($.trim($(this).val())=="") {
				$("#"+$(this).attr("id")+"_alert").show();
			}
			$("#"+$(this).attr("id")+"_error").hide();
		});
	},
	clearingFields : function() {
		page_daily_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_daily.clearingFields();
		});
	},
	validForm : function() {
		var valid = true;
		if($.trim($("#cdcode").val())=="") {
			$("#cdcode_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#amt").val())=="") {
			$("#amt_layer").addClass("has-error");
			valid = false;
		}
		try{
			var cdamt = parseFloat($("#amt").val());
			if(!cdamt || isNaN($("#amt").val())) {
				$("#amt_layer").addClass("has-error");
				$("#amt_error").show();
				return false;
			}
			if(cdamt<=0) {
				$("#amt_layer").addClass("has-error");
				$("#amt_error").show();
				return false;
			}
		}catch(ex) { 
			$("#amt_layer").addClass("has-error");
			$("#amt_error").show();
			valid = false;
		}
		return valid;
	},
	search : function(aform) {
		if(!aform) aform = fssearchform;
		if($.trim($("#cdrefdates").val())=="") {
			alertmsg("QS0105","Date is not specified");
			return false;
		}
		startWaiting();
		jQuery.ajax({
			url: "page_daily/page_daily_c.jsp",
			type: "POST",
			data: $(aform).serialize(),
			dataType: "html",
			contentType: defaultContentType,
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				page_daily.searchComplete(transport,data);
			}
		});	
	},
	searchComplete : function(xhr,data) {
		stopWaiting();
		$("#listpanel").html(data);
		$("#cdrefdate").val($("#cdrefdates").val());
	},
	edit : function() {
		page_daily_form.fsAction.value = "edit";		
		var label = fs_getLabelName("edit_modalheader",fs_currentpid,fs_default_language);
		if(!label || label=="") label = "Edit Journal";
		$("#modalheader").html(label);
		$("#page_daily_savebutton").show();
		$("#page_daily_savebutton").unbind("click");
		$("#page_daily_savebutton").bind("click",function() { 
			page_daily.save();
			return false;
		});
		$("#page_daily_detail").modal("show");
	},
	initFields : function() {
		$("#cdcode").val("");
		$("#amt").val("");
		$("#remark").val("");
		var isz = $("tr.data-row",$("#datatablebody")).size()+1;
		$("#cdseqno").val(""+isz);
		$(".my-input").each(function(index,element) { 
			$("#"+$(this).attr("id")+"_layer").removeClass("has-error");
			$("#"+$(this).attr("id")+"_alert").hide();		
			$("#"+$(this).attr("id")+"_error").hide();
		});
		$("span.cdtype-class").hide();
	},
	insert : function() {
		page_daily_form.fsAction.value = "enter";
		page_daily.initFields();
		var label = fs_getLabelName("new_modalheader",fs_currentpid,fs_default_language);
		if(!label || label=="") label = "New Journal";
		$("#modalheader").html(label);
		$("#page_daily_savebutton").show();
		$("#page_daily_savebutton").unbind("click");
		$("#page_daily_savebutton").bind("click",function() { 
			var acode = $("#cdcode").val();
			if(acode!="") {
				var isz = $("tr[title="+acode+"]",$("#datatablebody")).size();
				if(isz>0) {
					alertmsg("QS0103","Duplicate values list");
					return false;
				}
			}
			page_daily.save();
			return false;
		});
		$("#page_daily_detail").modal("show");
	},
	save : function(aform) {
		if(!aform) aform = page_daily_form;
		if(!page_daily.validForm()) return false;
		confirmSave(function() {
			startWaiting();
			var xhr = jQuery.ajax({
				url: "page_daily/page_daily_de_c.jsp",
				type: "POST",
				data: $(aform).serialize(),
				dataType: "html",
				contentType: defaultContentType,
				error : function(transport,status,errorThrown) { 
					submitFailure(transport,status,errorThrown);  
				},
				success: function(data,status,transport){ 
					stopWaiting();
					page_daily.search();
					successbox(function() { 
						if(page_daily_form.fsAction.value != "enter") {
							$("#page_daily_detail").modal("hide");
						}
						page_daily.initFields();
					});					
				}
			});
		});
		return false;
	},
	switchingLanguage : function(lang) {
		var placeholder = fs_getLabelName("cdcode_placeholder",fs_currentpid,lang);
		if(placeholder) $("#cdcode").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("amt_placeholder",fs_currentpid,lang);
		if(placeholder) $("#amt").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("newcdname_placeholder",fs_currentpid,lang);
		if(placeholder) $("#newcdname").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("newamt_placeholder",fs_currentpid,lang);
		if(placeholder) $("#newamt").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("remark_placeholder",fs_currentpid,lang);
		if(placeholder) $("#remark").attr("placeholder",placeholder);
		if("EN"==lang) {
			$("#nativeformat_label").hide();
			$("#interformat_label").show();
		} else {
			$("#interformat_label").hide();
			$("#nativeformat_label").show();
		}
		var atitle = fs_getLabelName("cdcodebutton_title",fs_currentpid,lang);
		if(atitle) $("#cdcodebutton").attr("title",atitle);
		atitle = fs_getLabelName("insertbutton_title",fs_currentpid,lang);
		if(atitle) $("#insertbutton").attr("title",atitle);
	},
	submitRetrieve : function(rowIndex,fsParams) {
		startWaiting();
		var xhr = jQuery.ajax({
			url: "page_daily/page_daily_de_c.jsp",
			type: "POST",
			contentType: defaultContentType,
			data: "fsAjax=true&fsAction=retrieve&fsDatatype=text&cdcode="+fsParams[0]+"&cdrefdate="+fsParams[1],
			dataType: "html",
			error : function(transport,status,errorThrown) { 
				submitFailure(transport,status,errorThrown);  
			},
			success: function(data,status,transport){ 
				stopWaiting();
				$("#pageremainder").html(data);
				page_daily.edit();
			}
		});
	},
	submitDelete : function(fsParams,rowIndex) {
		confirmDelete([rowIndex],function() {
			page_daily.deleteRecord(fsParams);
		});
	},
	deleteRecord : function(fsParams) {
		startWaiting();
		jQuery.ajax({
			url: "page_daily/page_daily_de_c.jsp",
			type: "POST",
			data: "fsAction=delete&fsDatatype=json&cdcode="+fsParams[0]+"&cdrefdate="+fsParams[1],
			dataType: "html",
			contentType: defaultContentType,
			error : function(transport,status,errorThrown) {
				submitFailure(transport,status,errorThrown);
			},
			success: function(data,status,transport){
				stopWaiting();
				page_daily.search();
			}
		});
	},
	validItemForm : function() {
		var valid = true;
		if($.trim($("#newcdname").val())=="") {
			$("#newcdname_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#newamt").val())=="") {
			$("#newamt_layer").addClass("has-error");
			valid = false;
		}
		try{
			var cdamt = parseFloat($("#newamt").val());
			if(!cdamt || isNaN($("#newamt").val())) {
				$("#newamt_layer").addClass("has-error");
				$("#newamt_error").show();
				return false;
			}
			if(cdamt<=0) {
				$("#newamt_layer").addClass("has-error");
				$("#newamt_error").show();
				return false;
			}
		}catch(ex) { 
			$("#newamt_layer").addClass("has-error");
			$("#newamt_error").show();
			return false;
		}
		return valid;
	},
	saveItem : function(aform) {
		if(!aform) aform = page_item_form;
		if(!page_daily.validItemForm()) return false;
		confirmSave(function() {
			startWaiting();
			var xhr = jQuery.ajax({
				url: "page_item/page_item_de_c.jsp",
				type: "POST",
				data: $(aform).serialize(),
				dataType: "html",
				contentType: defaultContentType,
				error : function(transport,status,errorThrown) { 
					submitFailure(transport,status,errorThrown);  
				},
				success: function(data,status,transport){ 
					stopWaiting();
					successbox(function() { 
						$("#page_item_detail").modal("hide");
						var jsonData = $.parseJSON($.trim(data));
						if(jsonData["transactions"]) {
							if(parseFloat(jsonData["transactions"])>0) {
								var opt = $("<option></option>");
								opt.attr("value",jsonData["cdcode"]);
								opt.html(jsonData["cdname"]);
								$("#cdcode").append(opt).val(jsonData["cdcode"]);
								if(fs_itemlist) {
									if(fs_itemlist["rows"]) {
										fs_itemlist["rows"].push(jsonData);
									}
								}
								$("#cdcode").trigger("change");
							}
						}
					});					
				}
			});
		});
		return false;
	}
});
function codeItemChange(src) {
	var code = $("#cdcode").val();
	//alert(code);
	if("+1+"==code) {
		newItemList();
		return;
	}
	$(".my-input").each(function(index,element) { 
		$("#"+$(this).attr("id")+"_layer").removeClass("has-error");
		$("#"+$(this).attr("id")+"_alert").hide();		
		$("#"+$(this).attr("id")+"_error").hide();
	});
	$("span.cdtype-class").hide();
	if(fs_itemlist) {
		if(fs_itemlist["rows"]) {
			$(fs_itemlist["rows"]).each(function(index,element) { 
				if(code==element["cdcode"]) {
					if("1"==element["cdtype"]) {
						$("#receive_span").show();
					} else {
						$("#payment_span").show();
					}
					var amount = removeComma(element["amt"]);
					$("#amt").val(amount);
					return false;
				}
			});
		}
	}
}
function newItemList() {
		$("#newcdname").val("");
		$("#newamt").val("");
		$(".my-input",$("#page_item_detail")).each(function(index,element) { 
			$("#"+$(this).attr("id")+"_layer").removeClass("has-error");
			$("#"+$(this).attr("id")+"_alert").hide();		
			$("#"+$(this).attr("id")+"_error").hide();
		});
		var label = fs_getLabelName("newitem_modalheader",fs_currentpid,fs_default_language);
		if(!label || label=="") label = "New Item List";
		$("#item_modalheader").html(label);
		$("#page_item_savebutton").show();
		$("#page_item_savebutton").unbind("click");
		$("#page_item_savebutton").bind("click",function() { 
			page_daily.saveItem();
			return false;
		});
		$("#page_item_detail").modal("show");
		return false;
}