require 'java'

java_import 'org.springframework.mock.web.MockHttpServletRequest'
java_import 'javax.servlet.http.HttpServletRequest'

module Reigns
  class HttpRequest
    include Java::JavaxServletHttp::HttpServletRequest
    
    attr_accessor :content
    
    def initialize
      @content = ""
      @delegate = MockHttpServletRequest.new
      yield self if block_given?
    end

    def method_missing(method, *args, &block)
      @delegate.send(method, *args)
    end
    
    def method=(method_string)
      @delegate.set_method(method_string)
    end

    def method
      @delegate.get_method
    end
      
    def uri=(uri_string)
      @delegate.set_request_uri(uri_string)
    end

    def uri
      @delegate.get_request_uri
    end
  end
end
