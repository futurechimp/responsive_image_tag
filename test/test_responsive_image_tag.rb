require 'helper'

class TestResponsiveImageTag < MiniTest::Unit::TestCase
    
  describe "A responsive_image_tag" do
    describe "in rails" do
      before do
        ActionView::Base.send(:include, ResponsiveImageTag)
        ENV["RAILS_ASSET_ID"] = ""
        view = ActionView::Base.new
        @tag = view.responsive_image_tag("small.jpg", "big.jpg")
        @doc = Nokogiri::HTML.fragment(@tag)
      end
      
      it "should write in one <span>" do
        assert_equal 1, @doc.xpath('span').length
      end
      
      it "should put a img-placeholder class on the <span>" do
        span_class = @doc.xpath('span').first.attributes["class"]
        assert_equal "img-placeholder", span_class.value
      end

      it "should write an <img> tag" do
        @tag.must_match "<img"
      end

      it "should put a src attribute on <img" do
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
      
      describe "the noscript tag" do
        before do
          @noscript = @doc.xpath("noscript").first
        end
      
        it "should exist, once" do
          assert_equal(1, @doc.xpath("noscript").length)
        end
      
        it "should have a data-fullsrc attribute" do
          assert @noscript.attributes["data-fullsrc"]
        end
        
        it "should point data-fullsrc at the big image" do
          assert_equal "/images/big.jpg",
            @noscript.attributes["data-fullsrc"].value
        end
      
        it "should have a data-mobilesrc attribute" do
          assert @noscript.attributes["data-mobilesrc"]
        end
        
        it "should point data-mobilesrc at the small image" do
          assert_equal "/images/small.jpg",
            @noscript.attributes["data-mobilesrc"].value
        end
      
        it "should put the 'responsivize' class on the <noscript> tag" do
          assert @noscript.attributes["class"]
          assert @noscript.attributes["class"].value = "responsivize"
        end
        
      end  
      
      describe "with an :alt option specified" do
        before do
          view = ActionView::Base.new
          @tag = view.responsive_image_tag(
                    "small.jpg", "big.jpg", :alt => "foo")
          @doc = Nokogiri::HTML.fragment(@tag)
        end
        
        it "should put an :alt attribute on the <noscript> tag" do
          noscript = @doc.xpath("noscript").first
          assert noscript.attributes["alt"]
        end
        
        it "should put a value of 'foo' into the :alt" do
          noscript = @doc.xpath("noscript").first
          assert_equal "foo", noscript.attributes["alt"].value
        end        
        
      end
       
    end
  end
end
