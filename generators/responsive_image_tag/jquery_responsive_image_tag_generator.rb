class JqueryResponsiveImageTagGenerator < Rails::Generator::Base

  SOURCE = File.join("..", "..", "..", "lib", "generators", "responsive_image_tag", "templates", "responsive-image-tag-jquery.js")

  def manifest
    record do |m|
        m.file SOURCE, "public/javascripts/responsive-image-tag-jquery.js"
    end
  end

end
