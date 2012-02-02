require 'java'

java_import 'javax.servlet.http.HttpServlet'
java_import 'org.springframework.web.servlet.DispatcherServlet'
java_import 'org.springframework.mock.web.MockServletConfig'
java_import 'org.springframework.mock.web.MockHttpServletResponse'

module Reigns
  class FakeDispatcherServlet
    def service(request)
      response = MockHttpServletResponse.new
      puts "WOOOT! @servlet is actually a #{@servlet}"
      @servlet.service(request, response)
      puts "STUART - THIS IS ODD. It's not getting here."
      response
    end
    
    def context
      @servlet.getWebApplicationContext()
    end
    
    def get(uri, *args)
      request = HttpServletRequest.new(:method => 'GET', :uri => uri)
      service(request)
    end

    def put(uri, *args)
      request = HttpServletRequest.new(:method => 'PUT', :uri => uri)
      content = ""
      yield(content)
      request.set_content(content.to_java_bytes)
      service(request)
    end

    def post(uri, *args)
      request = HttpServletRequest.new(:method => 'POST', :uri => uri)
      content = ""
      yield(content)
      request.set_content(content.to_java_bytes)
      service(request)
    end

    def delete(uri, *args)
      request = HttpServletRequest.new(:method => 'DELETE', :uri => uri)
      service(request)
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
