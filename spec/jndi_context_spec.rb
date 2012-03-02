require 'spec_helper'

module Reigns
  describe JNDIContext do
    context "when created with mappings" do
      before(:each) do
        @jndi_context = JNDIContext.new({'jndi_name' => 'service'})
      end

      it "stubs the default JNDI naming factory" do
        Java::java.lang.System.getProperty("java.naming.factory.initial").should eql "com._5values.jndistub.LightweightJNDIContextFactory"
      end
      
      it "should return the initial context configured with the mappings" do
        @jndi_context.lookup('jndi_name').should eql 'service'
      end

      it "should respond to, but ignore close messages" do
        @jndi_context.should respond_to(:close)
      end
    end
  end
end
