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
          @fake_dispatcher_servlet.service(:get, "/hello").get_status.should eql 200
        end
      end
      
      context "to a resource that doesn't exist" do
        it "returns an HTTPResponse with a 404 code" do
          @fake_dispatcher_servlet.service(:get, "/goodbye").get_status.should eql 404
        end
      end
    end
    
    describe "message routing" do
      before(:each) do
        @fake_dispatcher_servlet.stub(:service)
      end
      
      it "routes get messages to #service" do
        @fake_dispatcher_servlet.should_receive(:service).with(:get, "/a_uri")
        @fake_dispatcher_servlet.get("/a_uri")
      end
      
      it "routes put messages to #service" do
        @fake_dispatcher_servlet.should_receive(:service).with(:put, "/a_uri")
        @fake_dispatcher_servlet.put("/a_uri")        
      end
      
      it "routes post messages to #service" do
        @fake_dispatcher_servlet.should_receive(:service).with(:post, "/a_uri")
        @fake_dispatcher_servlet.post("/a_uri")
      end
      
      it "routes delete messages to #service" do
        @fake_dispatcher_servlet.should_receive(:service).with(:delete, "/a_uri")
        @fake_dispatcher_servlet.delete("/a_uri")
      end
    end    
  end
end
