var page_change = $.extend({},base,{
	title: "Change Password",
	init: function(setting) { 
		page_change.setupComponents();
	},
	setupComponents : function() {
		$("#page_change_savebutton").click(function() { 
			page_change.save();
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
		$("#userpassword").blur(function() { 
			if($("#userpassword").val()==$("#confirmpassword").val()) {
				$("#confirmpassword_error").hide();
			}
		});
		$("#confirmpassword").blur(function() { 
			if($("#userpassword").val()==$("#confirmpassword").val()) {
				$("#confirmpassword_error").hide();
			}		
		});
	},
	clearingFields : function() {
		page_change_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_change.clearingFields();
		});
	},
	validForm : function() {
		var valid = true;
		if($.trim($("#oldpassword").val())=="") {
			$("#oldpassword_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#userpassword").val())=="") {
			$("#userpassword_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#confirmpassword").val())=="") {
			$("#confirmpassword_layer").addClass("has-error");
			valid = false;
		}
		if($("#userpassword").val()!=$("#confirmpassword").val()) {
			$("#confirmpassword_layer").addClass("has-error");
			$("#confirmpassword_error").show();
			valid = false;
		}
		return valid;
	},
	save : function(aform) {
		if(!aform) aform = page_change_form;
		if(!page_change.validForm()) return false;
		confirmChange(function() {
			startWaiting();
			var xhr = jQuery.ajax({
				url: "page_change/page_change_c.jsp",
				type: "POST",
				data: $(aform).serialize(),
				dataType: "html",
				contentType: defaultContentType,
				error : function(transport,status,errorThrown) { 
					submitFailure(transport,status,errorThrown);  
				},
				success: function(data,status,transport){ 
					stopWaiting();
					alertbox("QS0008",function() { page_change.clearingFields(); goHome(); });					
				}
			});
		});
		return false;
	},
	switchingLanguage : function(lang) {
		var placeholder = fs_getLabelName("oldpassword_placeholder",fs_currentpid,lang);
		if(placeholder) $("#oldpassword").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("userpassword_placeholder",fs_currentpid,lang);
		if(placeholder) $("#userpassword").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("confirmpassword_placeholder",fs_currentpid,lang);
		if(placeholder) $("#confirmpassword").attr("placeholder",placeholder);
	}
});
