require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'responsive_image_tag'

require 'active_support'
require 'action_view'

class MiniTest::Unit::TestCase
end

MiniTest::Unit.autorun
