(function($) {
  if(!$.responsiveImageTag){
    $.responsiveImageTag = new Object();
  };

  $.responsiveImageTag = function(el, options) {
    // To avoid scope issues, use 'base' instead of 'this'
    // to reference this class from internal events and functions.
    var base = this;

    // Access to jQuery and DOM versions of element
    base.$el = $(el);
    base.el = el;
    base.el.data('responsiveImageTag', base);
    base.platform = "desktop";
    base.options = $.extend({}, $.responsiveImageTag.defaultOptions, options);

    //Public functions
    base.init = function() {
      // Test for available width in current browser window
      // 767px, anything smaller than an ipad is considered mobile
      if(screen.width <= 767){
        base.platform = "mobile";
      }

      var $img = $("<img/>", {
                    "alt": base.$el.attr("data-alttext"),
                    "class": base.$el.attr("data-cssclass")
                  });

      if(base.platform === "mobile"){
        $img.attr("src", base.$el.attr("data-mobilesrc"));
      }else{
        $img.attr("src", base.$el.attr("data-fullsrc"));
      }

      base.$el.prev().append($img);
      base.$el.hide();
    };

    // Call init function
    base.init();
  };

  $.responsiveImageTag.defaultOptions = {
    // Currently no options
  };

  $.fn.responsiveImageTag = function(options) {
    return this.each(function() {
       (new $.responsiveImageTag($(this), options));
    });
  };

  //Private function

})(jQuery);