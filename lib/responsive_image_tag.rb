module ResponsiveImageTag
  
  def responsive_image_tag(small, big, options = {})
    options = options.merge!("full-src" => big)
    image_tag(small, options)
  end
  
end

ActionView::Base.send(:include, ResponsiveImageTag) if defined?(ActionView::Base)