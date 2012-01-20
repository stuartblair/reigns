require 'spec_helper'

module Reigns
  describe FakeDispatcherServlet do    
    describe "#get" do
      
      before (:each) do 
        @fake_dispatcher_servlet = FakeDispatcherServlet.new("WEB-INF/mvc-dispatcher-servlet.xml")
      end
      
      context "to a resource that exists" do        
        it "returns an HTTPResponse with a 200 code" do
          @fake_dispatcher_servlet.get("/hello").get_status.should eql 200
        end
      end
      
      context "to a resource that doesn't exist" do
        it "returns an HTTPResponse with a 404 code" do
          @fake_dispatcher_servlet.get("/goodbye").get_status.should eql 404
        end
      end
      
    end
  end
end
