module KnowsSpring
  def set_context_location(context_location)
    @context_location = context_location
  end

  def host_application
    @fake_dispatcher_servlet = FakeDispatcherServlet.new(context_location)
  end
end
World(KnowsSpring)
