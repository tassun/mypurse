var fs_FULLMONTHS = {"EN":["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"], "TH":['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม']};
var page_regist = $.extend({},base,{
	title: "Registration",
	init: function(setting) { 
		page_regist.setupComponents();
	},
	setupComponents : function() {
		$("#page_regist_savebutton").click(function() { 
			page_regist.save();
			return false;
		});
		setupDateFields("#birthday","#birthmonth","#birthyear",fs_default_language);
		$("#birthyear").change(function() { 
			setupDateFields("#birthday","#birthmonth","#birthyear",fs_default_language);
		});
		$("#birthmonth").change(function() { 
			setupDateFields("#birthday","#birthmonth","#birthyear",fs_default_language);
		});
		$("input.my-input").focus(function() { 
			$("#"+$(this).attr("id")+"_layer").removeClass("has-error");
			$("#"+$(this).attr("id")+"_alert").hide();
		}).blur(function() { 
			if($.trim($(this).val())=="") {
				$("#"+$(this).attr("id")+"_alert").show();
			}			
		});
		$("#confirmbox").change(function() { 
			$("#confirmbox_layer").removeClass("has-error"); 
			$("#confirmbox_error").hide(); 
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
		$("#email").blur(function() { 
			$("#email_error").hide();
		});
		$("#userid").blur(function() { 
			$("#userid_error").hide();
			var uid = $("#userid").val();
			if($.trim(uid)!="") {
				jQuery.ajax({
					url: "page_regist/page_regist_user_c.jsp",
					type: "POST",
					data: "fsAjax=true&fsJson=true&userid="+uid,
					dataType: "html",
					contentType: defaultContentType,
					error : function(transport,status,errorThrown) { 
					},
					success: function(data,status,transport){ 
						var json = $.parseJSON($.trim(data));
						if(json["transactions"]) {
							if(parseInt(json["transactions"])>0) {
								$("#userid_error").show();
							}
						}
					}
				});				
			}
		});
	},
	clearingFields : function() {
		page_regist_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_regist.clearingFields();
		});
	},
	validForm : function() {
		var valid = true;
		if($.trim($("#usertname").val())=="") {
			$("#usertname_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#usertsurname").val())=="") {
			$("#usertsurname_layer").addClass("has-error");
			valid = false;
		}
		if($.trim($("#userid").val())=="") {
			$("#userid_layer").addClass("has-error");
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
		if($.trim($("#email").val())=="") {
			$("#email_layer").addClass("has-error");
			valid = false;
		} else {
			if(!validateEmail($("#email").val())) {
				$("#email_layer").addClass("has-error");
				$("#email_error").show();
				valid = false;
			}
		}
		if($("#userpassword").val()!=$("#confirmpassword").val()) {
			$("#confirmpassword_layer").addClass("has-error");
			$("#confirmpassword_error").show();
			valid = false;
		}
		if(!$("#confirmbox").is(":checked")) {
			$("#confirmbox_layer").addClass("has-error");
			$("#confirmbox_error").show();
			valid = false;
		}
		return valid;
	},
	save : function(aform) {
		if(!aform) aform = page_regist_form;
		if(!page_regist.validForm()) return false;
		confirmRegister(function() {
			startWaiting();
			var xhr = jQuery.ajax({
				url: "page_regist/page_regist_de_c.jsp",
				type: "POST",
				data: $(aform).serialize(),
				dataType: "html",
				contentType: defaultContentType,
				error : function(transport,status,errorThrown) { 
					submitFailure(transport,status,errorThrown);  
				},
				success: function(data,status,transport){ 
					stopWaiting();
					alertbox("QS0007",function() { page_regist.clearingFields(); doLogin(); });					
				}
			});
		});
		return false;
	},
	switchingLanguage : function(lang) {
		setupDateFields("#birthday","#birthmonth","#birthyear",lang);
		var placeholder = fs_getLabelName("usertname_placeholder",fs_currentpid,lang);
		if(placeholder) $("#usertname").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("usertsurname_placeholder",fs_currentpid,lang);
		if(placeholder) $("#usertsurname").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("userid_placeholder",fs_currentpid,lang);
		if(placeholder) $("#userid").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("userpassword_placeholder",fs_currentpid,lang);
		if(placeholder) $("#userpassword").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("confirmpassword_placeholder",fs_currentpid,lang);
		if(placeholder) $("#confirmpassword").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("email_placeholder",fs_currentpid,lang);
		if(placeholder) $("#email").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("mobile_placeholder",fs_currentpid,lang);
		if(placeholder) $("#mobile").attr("placeholder",placeholder);
	}
});
function setupDateFields(ddsrc,mmsrc,yysrc,lang) {
	if(!lang) lang = "EN";
	var now = new Date();
	var yy = now.getFullYear();
	var mm = now.getMonth();
	var dd = now.getDate();

	var miny = 1900;
	var maxy = yy;
	var daysrc = $(ddsrc);
	if(daysrc.val() && daysrc.val()!="") dd = parseInt(daysrc.val());
	var monsrc = $(mmsrc);
	if(monsrc.val() && monsrc.val()!="") mm = parseInt(monsrc.val());
	var yrsrc = $(yysrc);
	if(yrsrc.val() && yrsrc.val()!="") yy = parseInt(yrsrc.val());
	
	daysrc.empty();
	var maxd = getLastDayOfMonth(mm,yy);
	for(var i=1;i<=maxd;i++) {
		$("<option value='"+i+"'>"+i+"</option>").appendTo(daysrc);
	}
	if(dd>maxd) dd = maxd;
	daysrc.val(dd);

	monsrc.empty();
	$(fs_FULLMONTHS[lang]).each(function(index,element) { 
		$("<option value='"+index+"'>"+element+"</option>").appendTo(monsrc);
	});
	monsrc.val(mm);
		
	yrsrc.empty();
	for(var i=miny;i<=maxy;i++) {
		var yri = i;
		if("TH"==lang) yri = i+543; 
		$("<option value='"+i+"'>"+yri+"</option>").appendTo(yrsrc);
	}
	yrsrc.val(yy);
}
