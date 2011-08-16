function replaceImages(){
		
		var responsiveImages = $$(".responsivize");
		var i, 
			noOfresponsiveImages = responsiveImages.length;
		
		for(i = 0; i < noOfresponsiveImages; i = i + 1 ){
			var newImg = window.document.createElement("img");
			newImg.src = responsiveImages[i].getAttribute("data-fullsrc");
			responsiveImages[i].previous().appendChild(newImg);
			responsiveImages[i].style.display = "none"; 
		}
          
}  

document.observe("dom:loaded", function() {
	replaceImages()
})
