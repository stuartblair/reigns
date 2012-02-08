require 'java'

java_import 'org.springframework.mock.web.MockHttpServletRequest'

module Reigns
  class WebClient
    def initialize(fake_dispatcher_servlet)
      @fake_dispatcher_servlet = fake_dispatcher_servlet
    end
    
    def get(uri)
      http_request = HttpRequest.new do |r|
        r.method = 'GET'
        r.uri = uri
      end
      @fake_dispatcher_servlet.service(http_request)
    end
    
    def put(uri)
      http_request = HttpRequest.new do |r|
        r.method = 'PUT'
        r.uri = uri
        yield r
      end
      @fake_dispatcher_servlet.service(http_request)
    end

    def post(uri)
      http_request = HttpRequest.new do |r|
        r.method = 'POST'
        r.uri = uri
        yield r
      end
      @fake_dispatcher_servlet.service(http_request)
    end
    
    def delete(uri)
      http_request = HttpRequest.new do |r|
        r.method = 'DELETE'
        r.uri = uri
      end
      @fake_dispatcher_servlet.service(http_request)
    end
  end

end
