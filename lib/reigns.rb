unless defined? JRUBY_VERSION
  raise "Only works under JRUBY"
end

require File.join(File.dirname(__FILE__), '..', 'jars', 'jndistub-1.0.jar')
require "reigns/version"
require "reigns/jndi_context"
require "reigns/fake_dispatcher_servlet"
require "reigns/http_servlet_request"

