require 'spec_helper'
java_import 'org.springframework.context.ApplicationContext'
java_import 'org.springframework.mock.web.MockHttpServletRequest'

module Reigns
  describe HttpServletRequest do    
    before (:each) do
      @mock_http_servlet_request = MockHttpServletRequest.new
      @http_servlet_request = HttpServletRequest.new(:mock_http_servlet_request => @mock_http_servlet_request)
    end
    
    describe "set_content" do
      it "sets request content from the content attribute as java bytes on the underlying MockHttpServletRequest" do
        @http_servlet_request.content = "name=Stuart"
        @mock_http_servlet_request.should_receive(:set_content).with(a_java_byte_array_for("name=Stuart"))
        @http_servlet_request.set_content
      end
    end
    
    describe "message routing" do
      it "delegates all messages for unimplemented methods to the MockHttpServletRequest" do
        @mock_http_servlet_request.should_receive(:get_request_URI)
        @http_servlet_request.get_request_URI
      end
    end
  end
end
