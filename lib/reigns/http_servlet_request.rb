require 'java'

java_import 'org.springframework.mock.web.MockHttpServletRequest'

module Reigns
  class HttpServletRequest
    attr_accessor :content

    def set_content
      puts "about to set the content '#{@content}' on the delegate as java bytes '#{@content.to_java_bytes.to_s}'"
      @delegate.set_content(@content.to_java_bytes)
    end

    private
    
    def initialize(mock_http_servlet_request = MockHttpServletRequest.new)
      @content = ""
      @delegate = mock_http_servlet_request
    end

    def method_missing(method, *args, &block)
      @delegate.send(method, args, block)
    end
  end
end
