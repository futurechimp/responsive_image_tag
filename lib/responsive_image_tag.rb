module ResponsiveImageTag
  
  # Emits the special (and somewhat ugly) markup for our responsive image
  # tag.
  #
  # NB: the @image_path@ method is a private method of the Rails
  # asset_tag_helper.
  #
  def responsive_image_tag(small, big, options = {})
    output = tag "span", {:class => "img-placeholder"}
    output += tag "/span"
    output += tag "noscript", {"data-fullsrc" => image_path(big), :class => "responsivize"}, true
    output += image_tag(small, options)
    output += tag "/noscript", nil, true
    output
  end
  
end

ActionView::Base.send(:include, ResponsiveImageTag) if defined?(ActionView::Base)
