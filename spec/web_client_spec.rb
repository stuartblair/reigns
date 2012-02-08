require 'spec_helper'

module Reigns
  describe WebClient do    
    before (:each) do
      @fake_dispatcher_servlet = double('fake_dispatcher_servlet')
      @web_client = WebClient.new(@fake_dispatcher_servlet)
    end
    
    describe "#get" do
      it "routes to the fake_dispatcher_servlet" do
        @fake_dispatcher_servlet.should_receive(:service)
        @web_client.get("/a_uri")
      end
    end

    describe "#put" do
      it "routes to the fake_dispatcher_servlet" do
        @fake_dispatcher_servlet.should_receive(:service)
        @web_client.put("/a_uri") {}
      end

      it "sends content to the fake_dispatcher_servlet as part of the http_request" do
        @fake_dispatcher_servlet.should_receive(:service).with(a_http_request_with(:content => "name=Stuart"))
        @web_client.put("/a_uri") do |request|
          request.content = "name=Stuart"
        end
      end
    end
    
    describe "#post" do
      it "routes to the fake_dispatcher_servlet" do
        @fake_dispatcher_servlet.should_receive(:service)
        @web_client.post("/a_uri") {}
      end

      it "sends content to the fake_dispatcher_servlet as part of the http_request" do
        @fake_dispatcher_servlet.should_receive(:service).with(a_http_request_with(:content => "name=Stuart"))
        @web_client.post("/a_uri") do |request|
          request.content = "name=Stuart"
        end
      end
    end

    describe "#delete" do
      it "routes to the fake_dispatcher_servlet" do
        @fake_dispatcher_servlet.should_receive(:service)
        @web_client.delete("/a_uri")
      end
    end

  end
end
