require 'java'

java_import 'org.springframework.web.servlet.DispatcherServlet'
java_import 'org.springframework.mock.web.MockServletConfig'
java_import 'org.springframework.mock.web.MockHttpServletResponse'
java_import 'org.springframework.mock.web.MockHttpServletRequest'

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
    
    private
    
    def initialize(context_location)
      @servlet = DispatcherServlet.new
      config = MockServletConfig.new("resources")
      config.add_init_parameter("contextConfigLocation", context_location)
      @servlet.init(config)
    end
  end
end
