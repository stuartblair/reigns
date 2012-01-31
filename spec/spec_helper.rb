$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'reference_apps'))
require 'java'
require 'classpath'
require 'reigns'

RSpec::Matchers.define :implement do |interface|
  def name_of(interface)
    interface.java_class.to_s
  end
  
  match do |class_instance|
    interface.java_class.assignable_from?(class_instance.java_class)
  end
  
  failure_message_for_should do |class_instance|
    "expected the class instance #{class_instance.to_s} to implement the interface #{name_of(interface)}"
  end

  failure_message_for_should_not do |class_instance|
    "expected the class instance #{class_instance.to_s} not to implement the interface #{name_of(interface)}"
  end

  description do
    "expected a class instance which implements the interface #{name_of(interface)}"
  end
end

class MockHttpServletRequestMatcher
  def initialize(expected_params)
    @expected_params = expected_params
  end
  
  def description
    "a MockHttpServletRequest with #{@expected_params}"
  end
  
  def ==(actual)
    match = true
    @expected_params.each do |key, value|
      result = actual.send(key).to_s
      if (result != value) 
        match = false
      end
    end
    match
  end  
end

def a_mock_http_servlet_request_with(expected_params)
  MockHttpServletRequestMatcher.new(expected_params)
end

