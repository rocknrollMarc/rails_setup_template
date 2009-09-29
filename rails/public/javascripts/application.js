$(function() {
	// Block UI (AJAX Processing)
	$.blockUI.defaults.overlayCSS.opacity = 0;
	$(document).ajaxStart(function() {
	  $.blockUI({
	    theme: true,
	    title: "Processing Request",
	    message: $("#ajax")
	  });
	});
	$(document).ajaxStop(function() {
	  $.unblockUI();
	});
	
	// REST
  $.rest();
});
