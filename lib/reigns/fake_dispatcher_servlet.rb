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
      puts "Just about to submit a #{request.getMethod} to #{request.getRequestURI}"
      @servlet.service(request, response)
      response
    end

    def context
      @servlet.getWebApplicationContext()
    end
    
    private
    
    def initialize(context_location)
      @servlet = DispatcherServlet.new
      config = MockServletConfig.new("resources")
      config.add_init_parameter("contextConfigLocation", context_location)
      @servlet.init(config)
    end

    def method_missing(http_method, uri, *args, &block)
      if (/get|put|post|delete/ =~ http_method.to_s.downcase)
        request = MockHttpServletRequest.new(http_method.to_s.upcase, uri)
        send(:service, request)
      end
    end
  end
end
