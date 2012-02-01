module KnowsSpring
  def host_application(context_location)
    @fake_dispatcher_servlet = ::Reigns::FakeDispatcherServlet.new(context_location)
  end

  def dispatcher
    @fake_dispatcher_servlet
  end

  def send_request(method, uri)
    @fake_dispatcher_servlet.send(method.downcase, uri)
  end
  
  def lookup_bean(bean_id)
    @fake_dispatcher_servlet.context.send(:get_bean, bean_id)
  end
end

World(KnowsSpring)
