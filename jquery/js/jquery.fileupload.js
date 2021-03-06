/*
// jQuery Ajax File Uploader
//
//  - Ajaxifies an individual <input type="file">
//  - Files are sandboxed. Doesn't matter how many, or where they are, on the page.
//  - Allows for extra parameters to be included with the file
//  - onStart callback can cancel the upload by returning false
*/
(function($) {    
    var settings = {
      params: {},
      action: '',
	  createParams : function() { return null; },
      onStart: function() {  },
      onComplete: function(response) {  },
      onCancel: function() { }
    };    
    /*
    // Internal handler that tries to parse the response 
    //  and clean up after ourselves. 
    */
    var handleResponse = function(loadedFrame, element) {
      var response, responseStr = loadedFrame.contentWindow.document.body.innerHTML;
      try {
			response = $.parseJSON(responseStr); //JSON.parse(responseStr);
      } catch(e) {
			var idx = responseStr.indexOf("}");
			if(idx>0) {
				var resstr = responseStr.substring(0,idx+1);
				try {
					response = $.parseJSON(resstr);
				} catch(ex) { 
					response = responseStr;
				}
			} else {
				response = responseStr;
			}
      }
      // Tear-down the wrapper form
      element.siblings().remove();
      element.unwrap();      
      // Pass back to the user
      settings.onComplete.apply(element, [response, settings.params]);
    };        
    /*
    // Wraps element in a <form> tag, and inserts hidden inputs for each
    //  key:value pair in settings.params so they can be sent along with
    //  the upload. Then, creates an iframe that the whole thing is 
    //  uploaded through. 
    */
    var wrapElement = function(element) {
		var evalue = element.val();
      // Create an iframe to submit through, using a semi-unique ID
      var frame_id = 'ajaxUploader-iframe-' + Math.round(new Date().getTime() / 1000)
      $('body').after('<iframe width="0" height="0" style="display:none;" name="'+frame_id+'" id="'+frame_id+'"/>');
      $('#'+frame_id).load(function() {
        handleResponse(this, element);
      });      
      // Wrap it in a form
      element.wrap(function() {
        return '<form action="' + settings.action + '" method="POST" enctype="multipart/form-data" target="'+frame_id+'" />'
      })
      // Insert <input type='hidden'>'s for each param
      .after(function() {
        var key, html = '';
        for(key in settings.params) {
          html += '<input type="hidden" name="' + key + '" value="' + settings.params[key] + '" />';
        }
		if(settings.createParams) {
			var prms = settings.createParams();
			if(prms) {
				for(key in prms) {
					html += '<input type="hidden" name="' + key + '" value="' + prms[key] + '" />';
				}
			}
		}
        return html;
      });
	  //element.val(evalue);
    }  
    $.fn.fileupload = function(options) {
        if ( options ) { 
          $.extend( settings, options );
        }      
        // 'this' is a jQuery collection of one or more (hopefully) 
        //  file elements, but doesn't check for this yet
        return this.each(function() {
          var $element = $(this);                
          // Skip elements that are already setup. May replace this 
          //  with uninit() later, to allow updating that settings
          if($element.data('ajaxUploader-setup') === true) return;
          $element.change(function() {
            if($element.val() == '') return settings.doCancel.apply($element, [settings.params]);            
            // Creates the form, extra inputs and iframe used to 
            //  submit / upload the file
            wrapElement($element);            
            // Call user-supplied (or default) onStart(), setting
            //  it's this context to the file DOM element
            var ret = settings.onStart.apply($element,[$element.val()]);
            // let onStart have the option to cancel the upload
            if(ret !== false)
            {
              $element.parent('form').submit();
            }
          });        
          // Mark this element as setup
          $element.data('ajaxUploader-setup', true);
        });
      }
})( jQuery )