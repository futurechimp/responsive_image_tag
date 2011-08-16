module ResponsiveImageTag
  
  # Emits the special (and somewhat ugly) markup for our responsive image
  # tag.
  #
  # NB: the @image_path@ method is a private method of the Rails
  # asset_tag_helper.
  #
  def responsive_image_tag(small, big, options = {})
    options["full-src"] = image_path(big)
    output = tag "span", {:class => "img-placeholder"}
    output += tag "noscript", nil, true
    output += image_tag(small, options)
    output += tag "/noscript", nil, true
    output
  end
  
end

ActionView::Base.send(:include, ResponsiveImageTag) if defined?(ActionView::Base)
