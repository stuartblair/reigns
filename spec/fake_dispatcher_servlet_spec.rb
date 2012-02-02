require 'spec_helper'
java_import 'org.springframework.context.ApplicationContext'

module Reigns
  describe FakeDispatcherServlet do    
    before (:each) do
      @fake_dispatcher_servlet = FakeDispatcherServlet.new("WEB-INF/mvc-dispatcher-servlet.xml")
    end
    
    describe "#context" do
      it "returns the spring application context" do
        @fake_dispatcher_servlet.context.should implement ApplicationContext
      end
    end
    
    describe "#service" do
      context "to a resource that exists" do        
        it "returns an HTTPResponse with a 200 code" do
          @fake_dispatcher_servlet.service(HttpServletRequest.new(:method =>'GET', :uri => "/hello")).get_status.should eql 200
        end
      end
      
      context "to a resource that doesn't exist" do
        it "returns an HTTPResponse with a 404 code" do
          @fake_dispatcher_servlet.service(HttpServletRequest.new(:method => 'GET', :uri => "/goodbye")).get_status.should eql 404
        end
      end
      
      context "when receiving form data" do
        it "sets the form data in the request content" do
          request = HttpServletRequest.new(:method =>'POST', :uri => "/echo")
          request.should_receive(:set_content).with("Here's the content".to_java_bytes)
          @fake_dispatcher_servlet.service(request) do |content|
            request.content << "Here's the content"
          end
        end
      end
      
      describe "message routing" do
        before(:each) do
          @request = double(HttpServletRequest)
        end
        
        it "routes get messages to #service" do
          @fake_dispatcher_servlet.should_receive(:service).with(a_mock_http_servlet_request_with(:getMethod =>'GET', :getRequestURI =>"/a_uri"))
          @fake_dispatcher_servlet.get("/a_uri")
        end
        
        it "routes put messages to #service" do
          @fake_dispatcher_servlet.should_receive(:service).with(a_mock_http_servlet_request_with(:getMethod =>'PUT', :getRequestURI =>"/a_uri"))
          @fake_dispatcher_servlet.put("/a_uri") {}    
        end
        
        it "routes post messages to #service" do
          @fake_dispatcher_servlet.should_receive(:service).with(a_mock_http_servlet_request_with(:getMethod =>'POST', :getRequestURI =>"/a_uri"))
          @fake_dispatcher_servlet.post("/a_uri") {}
        end
        
        it "routes delete messages to #service" do
          @fake_dispatcher_servlet.should_receive(:service).with(a_mock_http_servlet_request_with(:getMethod => 'DELETE', :getRequestURI => "/a_uri"))
          @fake_dispatcher_servlet.delete("/a_uri")
        end
      end    
    end
  end
end
