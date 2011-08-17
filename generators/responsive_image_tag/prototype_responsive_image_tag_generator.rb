class PrototypeResponsiveImageTagGenerator < Rails::Generator::Base

  SOURCE = File.join("..", "..", "..", "lib", "generators", "responsive_image_tag", "templates", "responsive-image-tag-prototype.js")

  def manifest
    record do |m|
        m.file SOURCE, "public/javascripts/responsive-image-tag-prototype.js"
    end
  end

end
