require 'helper'

class TestResponsiveImageTag < MiniTest::Unit::TestCase
    
  describe "A responsive_image_tag" do
    describe "in rails" do
      before do
        ActionView::Base.send(:include, ResponsiveImageTag)
        ENV["RAILS_ASSET_ID"] = ""
        view = ActionView::Base.new
        @tag = view.responsive_image_tag("small.jpg", "big.jpg")
      end

      it "should write an <img> tag" do
        @tag.must_match "img"
      end

      it "should have a src attribute" do
        @tag.must_match "src="
      end

      it "should use small.jpg as the value for src" do
        @tag.must_match "src=\"/images/small.jpg\""
      end

      it "should have a full-src attribute" do
        @tag.must_match "data-fullsrc="
      end

      it "should use big.jpg as the value for full-src" do
        @tag.must_match "data-fullsrc=\"/images/big.jpg\""
      end
      
      describe "with an :alt option specified" do
        before do
          view = ActionView::Base.new
          @tag = view.responsive_image_tag("small.jpg", "big.jpg", :alt => "foo")
        end
        it "should have an alt attribute with a value of 'foo'" do
          @tag.must_match "alt=\"foo\""
        end
      end
      
      describe "with ENV['RAILS_ASSET_ID'] set" do
        before do
          ENV["RAILS_ASSET_ID"] = "images/"
          view = ActionView::Base.new
          @tag = view.responsive_image_tag("small.jpg", "big.jpg")
        end
        
        it "should prepend the correct asset path onto full-src" do
          @tag.must_match "data-fullsrc=\"/images/big.jpg"
        end
      end
       
    end
  end
end
