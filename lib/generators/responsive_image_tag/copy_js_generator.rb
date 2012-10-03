module ResponsiveImageTag
  module Generators
    class CopyJsGenerator < Rails::Generators::Base
      desc 'Creates a javascript file which takes care of responsive images for you'

      def self.source_root
        File.expand_path("../templates", __FILE__)
      end

      def copy_javascript_file
        template 'responsive-image-tag.js',
          File.join(
            'public', 'javascripts', 'responsive-image-tag.js')
      end

    end
  end
end