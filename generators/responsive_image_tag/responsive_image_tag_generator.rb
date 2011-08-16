class ResponsiveImageTagGenerator < Rails::Generator::Base

  JS_FILE = File.join("..", "..", "..", "public", "javascripts", "responsive-image-tag.js")

  def manifest
    record do |m|
        m.file JS_FILE, "lib/rails/generators/responsive_image_tag/javascript/templates/responsive-image-tag.js"
    end
  end

end
