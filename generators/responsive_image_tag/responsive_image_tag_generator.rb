class ResponsiveImageTagGenerator < Rails::Generator::Base

  SOURCE = File.join("..", "..", "..", "lib", "rails", "generators", "responsive_image_tagBLAH", "javascript", "templates", "responsive-image-tag.js")

  def manifest
    record do |m|
        m.file SOURCE, "public/javascripts/responsive-image-tag.js"
    end
  end

end
