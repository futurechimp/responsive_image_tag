# encoding: utf-8

module ResponsiveImageTag
  module Generators
    class JqueryGenerator < Rails::Generators::Base
      desc 'Creates a javascript file which takes care of responsive images for you'

      def self.source_root
        File.expand_path("../templates", __FILE__)
      end

      def create_javascript_file
        template 'responsive-image-tag-jquery.js', 
          File.join(
            'public', 'javascripts', 'responsive-image-tag-jquery.js')
      end
      
    end
  end
end