require 'spec_helper'

java_import 'javax.servlet.http.HttpServletRequest'

module Reigns
  describe HttpRequest do    
    before (:each) do
      @http_request = HttpRequest.new
    end
    
    describe "interface" do
      it "implements HttpServletRequest" do
        @http_request.should implement(HttpServletRequest)
      end
    end
    
    describe "content" do
      it "exposes the content of the http request" do
        @http_request.content = "This is the content"
        @http_request.content.should eql "This is the content"
      end
    end

    describe "uri" do
      it "exposes the uri of the http request" do
        @http_request.uri = "/a_uri"
        @http_request.uri.should eql "/a_uri"
      end
    end
  end
end
