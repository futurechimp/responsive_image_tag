/*jslint browser:true */
/*global $, $$*/

// responsiveImageTag detects all noscript elements on the page with a class
// of 'responsivize'.

// It retrieves both HTML5 data attributes and then creates an image tag with
// the correct source destination depending on the available screen width of
// the user'ss device. This way smaller images are sent to mobile devices or
// any device smaller than 768px.

// The <noscript> tags are then removed from the page.
var responsiveImageTag = {

    replaceInitialImages:function() {
		var platform = "desktop";
		var responsiveImages = $$(".responsivize");
		var i,
			noOfresponsiveImages = responsiveImages.length;

		// Test for available width in current browser window
		// 767px, anything smaller than an ipad is considered mobile
		if(screen.width <= 767){
			platform = "mobile";
		}

		// Set initial source element on image
		for(i = 0; i < noOfresponsiveImages; i = i + 1 ){
			var noScriptElem = responsiveImages[i];
			var img = window.document.createElement("img");

			img.alt = noScriptElem.getAttribute("data-alttext");
			img.className = noScriptElem.getAttribute("data-cssclass");

			if(platform === "mobile"){
				img.src = noScriptElem.getAttribute("data-mobilesrc");
			}else{
				img.src = noScriptElem.getAttribute("data-fullsrc");
			}

			noScriptElem.previous().appendChild(img);
			noScriptElem.style.display = "none";
		}
    }
};

document.observe("dom:loaded", function() {
	responsiveImageTag.replaceInitialImages();
});

