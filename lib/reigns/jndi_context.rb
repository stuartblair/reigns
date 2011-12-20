require 'java'
java_import "java.lang.System"

module Reigns
  class JNDIContext
    def initialize(mappings)
      System.setProperty("java.naming.factory.initial", "com._5values.jndistub.LightweightJNDIContextFactory")
      @mappings = mappings
    end

    def lookup_object(name)
      @mappings[name]
    end
  end
end
