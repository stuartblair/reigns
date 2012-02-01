require 'java'

java_import 'javax.servlet.http.HttpServlet'
java_import 'org.springframework.web.servlet.DispatcherServlet'
java_import 'org.springframework.mock.web.MockServletConfig'
java_import 'org.springframework.mock.web.MockHttpServletRequest'
java_import 'org.springframework.mock.web.MockHttpServletResponse'

module Reigns
  class FakeDispatcherServlet
    def service(request)
      response = MockHttpServletResponse.new
      @servlet.service(request, response)
      response
    end

    def context
      @servlet.getWebApplicationContext()
    end
    
    def post(uri, *args)
      request = MockHttpServletRequest.new('POST', uri)
      content = ""
      yield(content)
      request.set_content(content.to_java_bytes)
      send(:service, request)
    end

    private
    
    def initialize(context_location)
      @servlet = DispatcherServlet.new
      config = MockServletConfig.new("resources")
      config.add_init_parameter("contextConfigLocation", context_location)
      @servlet.init(config)
    end

    def method_missing(http_method, uri, *args, &block)
      if (/get|put|delete/ =~ http_method.to_s.downcase)
        request = MockHttpServletRequest.new(http_method.to_s.upcase, uri)
        send(:service, request)
      end
    end
  end
end
