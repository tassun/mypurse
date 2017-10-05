var fs_FULLMONTHS = {"EN":["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"], "TH":['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม']};
var page_profile = $.extend({},base,{
	title: "My Profile",
	init: function(setting) { 
		page_profile.setupComponents();
	},
	setupComponents : function() {
		$("#page_profile_editbutton").click(function() { 
			page_profile.edit();
			return false;
		});
		$("#page_profile_savebutton").click(function() { 
			page_profile.save();
			return false;
		});
		setupDateFields("#birthday","#birthmonth","#birthyear",fs_default_language,function() { 
			if($.trim($("#userbirthday").val())!="") $("#birthday").val($("#userbirthday").val());
			if($.trim($("#userbirthmonth").val())!="") $("#birthmonth").val($("#userbirthmonth").val());
			if($.trim($("#userbirthyear").val())!="") $("#birthyear").val($("#userbirthyear").val());
		});
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
		$("#email").blur(function() { 
			$("#email_error").hide();
		});
	},
	clearingFields : function() {
		page_profile_form.reset();
	},
	cancel : function() {
		confirmCancel(function() {
			page_profile.clearingFields();
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
		if($.trim($("#userid").val())=="") {
			$("#userid_layer").addClass("has-error");
			valid = false;
		}
		return valid;
	},
	edit : function(aform) {

	},
	save : function(aform) {
		if(!aform) aform = page_profile_form;
		if(!page_profile.validForm()) return false;
		confirmSave(function() {
			startWaiting();
			var xhr = jQuery.ajax({
				url: "page_profile/page_profile_de_c.jsp",
				type: "POST",
				data: $(aform).serialize(),
				dataType: "html",
				contentType: defaultContentType,
				error : function(transport,status,errorThrown) { 
					submitFailure(transport,status,errorThrown);  
				},
				success: function(data,status,transport){ 
					stopWaiting();
					successbox(function() { goHome(); });					
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
		placeholder = fs_getLabelName("address1_placeholder",fs_currentpid,lang);
		if(placeholder) $("#address1").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("address2_placeholder",fs_currentpid,lang);
		if(placeholder) $("#address2").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("email_placeholder",fs_currentpid,lang);
		if(placeholder) $("#email").attr("placeholder",placeholder);
		placeholder = fs_getLabelName("mobile_placeholder",fs_currentpid,lang);
		if(placeholder) $("#mobile").attr("placeholder",placeholder);
	}
});
function setupDateFields(ddsrc,mmsrc,yysrc,lang,fn) {
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
	if(fn) fn();
}
