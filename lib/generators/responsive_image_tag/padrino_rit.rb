module Padrino
  module Generators
    ##
    # Defines the generator for installing the Jquery Responsive Image Tag script.
    #
    class Rit < Thor::Group

      # Add this generator to our padrino-gen
      Padrino::Generators.add_generator(:rit, self)

      # Define the source template root and themes.
      def self.source_root; File.expand_path(File.dirname(__FILE__)); end
      # Defines the "banner" text for the CLI.
      def self.banner; "padrino g rit"; end

      # Include related modules
      include Thor::Actions
      include Padrino::Generators::Actions
      include Padrino::Generators::Admin::Actions

      desc "Description:\n\n\tpadrino g rit - Creates a JavaScript file which takes care of responsive images for you"

      class_option :js_destination, :aliases => "-d", :desc => "The destination path to copy the Javascript file too", :default => 'public/javascripts', :type => :string
      class_option :js_type, :aliases => "-t", :desc => "The type of Javascript file to use [jquery or prototype]", :default => 'jquery', :type => :string

      def create_javascript_file
        template "templates/responsive-image-tag-#{options[:js_type]}.js",
          destination_root(options[:js_destination] + "/responsive-image-tag-#{options[:js_type]}.js")
      end

    end
  end
end