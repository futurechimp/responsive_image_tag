class ResponsiveImageTagGenerator < Rails::Generator::Base

  SOURCE = File.join("..", "..", "..", "lib", "responsive_image_tag", "generators", "templates", "responsive-image-tag.js")

  def manifest
    record do |m|
        m.file SOURCE, "public/javascripts/responsive-image-tag.js"
    end
  end

end
