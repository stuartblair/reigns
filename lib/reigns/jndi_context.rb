require 'java'
java_import "java.lang.System"

module Reigns
  class JNDIContext
    def initialize(mappings)
      System.setProperty("java.naming.factory.initial", "com._5values.jndistub.LightweightJNDIContextFactory")
    end
  end
end
