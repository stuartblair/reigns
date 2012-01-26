require 'java'

java_import 'javax.servlet.http.HttpServlet'
java_import 'org.springframework.web.servlet.DispatcherServlet'
java_import 'org.springframework.mock.web.MockServletConfig'
java_import 'org.springframework.mock.web.MockHttpServletRequest'
java_import 'org.springframework.mock.web.MockHttpServletResponse'

module Reigns
  class FakeDispatcherServlet
    def service(method, uri)
      request = MockHttpServletRequest.new('GET', uri)
      response = MockHttpServletResponse.new
      @servlet.service(request, response)
      return response
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

    def method_missing(method, uri, *args, &block)
      if (/get|put|post|delete/ =~ method.to_s)
        send(:service, method, uri)
      end
    end
  end
end
