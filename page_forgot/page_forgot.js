var page_forgot = $.extend({},base,{
	title: "Forgot Password",
	init: function(setting) { 
		page_forgot.setupComponents();
	},
	setupComponents : function() {
		$("#page_forgot_savebutton").click(function() { 
			page_forgot.save();
			return false;
		});
		$("input.my-input").focus(function() { 
			$("#"+$(this).attr("id")+"_layer").removeClass("has-error");
			$("#"+$(this).attr("id")+"_alert").hide();
		}).blur(function() { 
			if($.trim($(this).val())=="") {
				$("#"+$(this).attr("id")+"_alert").show();
			}		
		});
		$("#secureimage_ctrl").click(function() { 
			$("#secureimage").attr("src","jsp/secureimage.jsp?"+Math.random());
			return false;
		});
	},
	clearingFields : function() {
		page_forgot_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_forgot.clearingFields();
		});
	},
	validForm : function() {
		var valid = true;
		if($.trim($("#userid").val())=="") {
			$("#userid_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#email").val())=="") {
			$("#email_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#securecode").val())=="") {
			$("#securecode_layer").addClass("has-error");
			valid = false;
		}
		return valid;
	},
	save : function(aform) {
		if(!aform) aform = page_forgot_form;
		if(!page_forgot.validForm()) return false;
		confirmSend(function() {
			startWaiting();
			var xhr = jQuery.ajax({
				url: "page_forgot/page_forgot_de_c.jsp",
				type: "POST",
				data: $(aform).serialize(),
				dataType: "html",
				contentType: defaultContentType,
				error : function(transport,status,errorThrown) { 
					submitFailure(transport,status,errorThrown);  
				},
				success: function(data,status,transport){ 
					stopWaiting();
					alertbox("QS0009",function() { page_forgot.clearingFields(); doLogin(); });					
				}
			});
		});
		return false;
	},
	switchingLanguage : function(lang) {
		var placeholder = fs_getLabelName("userid_placeholder",fs_currentpid,lang);
		if(placeholder) $("#userid").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("email_placeholder",fs_currentpid,lang);
		if(placeholder) $("#email").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("securecode_placeholder",fs_currentpid,lang);
		if(placeholder) $("#securecode").attr("placeholder",placeholder);
	}
});
