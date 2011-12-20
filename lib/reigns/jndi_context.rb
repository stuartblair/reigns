require 'java'
java_import "java.lang.System"
java_import "com._5values.jndistub.LightweightJNDIContextFactory"

module Reigns
  class JNDIContext
    def initialize(mappings)
      System.setProperty("java.naming.factory.initial", "com._5values.jndistub.LightweightJNDIContextFactory")
      @mappings = mappings
      LightweightJNDIContextFactory.set_context(self)
    end

    def lookup_object(name)
      @mappings[name]
    end
  end
end
