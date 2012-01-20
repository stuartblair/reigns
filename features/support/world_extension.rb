module KnowsSpring
  def host_application(context_location)
    @fake_dispatcher_servlet = ::Reigns::FakeDispatcherServlet.new(context_location)
  end

  def send_request(method, uri)
    @fake_dispatcher_servlet.send(method.downcase, uri)
  end
end

World(KnowsSpring)
