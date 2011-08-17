class JqueryResponsiveImageTagGenerator < Rails::Generator::Base

  SOURCE = File.join("..", "..", "..", "lib", "rails", "generators", "responsive_image_tag", "javascript", "templates", "responsive-image-tag-jquery.js")

  def manifest
    record do |m|
        m.file SOURCE, "public/javascripts/responsive-image-tag-jquery.js"
    end
  end

end
