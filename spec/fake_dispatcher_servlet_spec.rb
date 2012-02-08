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
	  http_request = HttpRequest.new do |r|
            r.method = 'GET'
            r.uri = "/hello"
          end
          @fake_dispatcher_servlet.service(http_request).get_status.should eql 200
        end
      end
      
      context "to a resource that doesn't exist" do
        it "returns an HTTPResponse with a 404 code" do
          http_request = HttpRequest.new do |r|
            r.method = 'GET'
            r.uri = "/missing"
          end
          @fake_dispatcher_servlet.service(http_request).get_status.should eql 404
        end
      end
    end
  end
end
