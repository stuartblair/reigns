require 'java'

java_import 'javax.servlet.http.HttpServlet'
java_import 'org.springframework.web.servlet.DispatcherServlet'
java_import 'org.springframework.mock.web.MockServletConfig'
java_import 'org.springframework.mock.web.MockHttpServletRequest'
java_import 'org.springframework.mock.web.MockHttpServletResponse'


module Reigns
  class FakeDispatcherServlet
    def initialize(context_location)
      @servlet = DispatcherServlet.new
      config = MockServletConfig.new("resources")
      config.add_init_parameter("contextConfigLocation", context_location)
      @servlet.init(config)
    end

    def get(uri)
      request = MockHttpServletRequest.new('GET', uri)
      response = MockHttpServletResponse.new
      @servlet.service(request, response);
      return response
    end
  end
end
