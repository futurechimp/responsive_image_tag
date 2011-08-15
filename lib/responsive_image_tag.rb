module ResponsiveImageTag
  
  def responsive_image_tag(small, big, options = {})
    full_src = ENV["RAILS_ASSET_ID"] + big
    options = options.merge!("full-src" => full_src)
    image_tag(small, options)
  end
  
end

ActionView::Base.send(:include, ResponsiveImageTag) if defined?(ActionView::Base)