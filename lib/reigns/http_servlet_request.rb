require 'java'

java_import 'org.springframework.mock.web.MockHttpServletRequest'

module Reigns
  class HttpServletRequest
    attr_accessor :content
    
    def set_content
      @delegate.set_content(@content.to_java_bytes)
    end
    
    private
    
    def initialize(params)
      if (params[:mock_http_servlet_request])
        initialize_with_mock_http_servlet_request(params[:mock_http_servlet_request])
      elsif (params[:method] && params[:uri])
        initialize_with_method_and_uri(params[:method], params[:uri])
      end
    end

    def initialize_with_mock_http_servlet_request(mock_http_servlet_request)
      @content = ""
      @delegate = mock_http_servlet_request
    end

    def initialize_with_method_and_uri(method, uri)
      puts "HttpServletRequest: initializing with #{method} and #{uri}"
      mock_http_servlet_request = MockHttpServletRequest.new(method, uri)
      initialize_with_mock_http_servlet_request(mock_http_servlet_request)
    end

    def method_missing(method, *args, &block)
      puts "HttpServletRequest: About to send a message='#{method}' to delegate with args='#{args}' and block='#{block}'"
      @delegate.send(method, args, block)
    end
  end
end
