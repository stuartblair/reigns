$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'reference_apps'))
require 'java'
require 'rubygems'
require 'json'
require 'classpath'
require 'reigns'

RSpec::Matchers.define :implement do |interface|
  def name_of(interface)
    interface.java_class.to_s
  end
  
  match do |class_instance|
    class_instance.class.include?(interface)
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

RSpec::Matchers.define :have_the_same_json_representation_as do |expected_json_representation|
  def name_of(expected_json_representation)
    expected_json_representation
  end

  match do |actual_json_representation|
    JSON.parse(actual_json_representation) == JSON.parse(expected_json_representation)
  end

  failure_message_for_should do |actual_json_representation|
    "expected the names and values of #{expected_json_representation} to match those in the actual json representation of #{actual_json_representation}"
  end 

  failure_message_for_should_not do |actual_json_representation|
    "expected the names and values of #{expected_json_representation} to mismatch against those in the actual json representation of #{actual_json_representation}"
  end 

  description do
    "expected a json representation corresponding to #{expected_json_representation}"
  end
end

class HttpRequestMatcher
  def initialize(expected_params)
    @expected_params = expected_params
  end
  
  def description
    "a HttpRequest with #{@expected_params}"
  end

  def ==(actual)
    match = true
    @expected_params.each do |key, value|
      result = actual.send(key)
      if (result != value)
        match = false
      end
    end
    match
  end
end

def a_http_request_with(expected_params)
  HttpRequestMatcher.new(expected_params)
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

class JavaByteArrayMatcher
  def initialize(expected_byte_array)
    @expected_byte_array = expected_byte_array
  end
  
  def description
    "a Java byte[] with values #{@expected_byte_array.to_a.join(',')}"
  end
  
  def ==(actual)
    @expected_byte_array.to_a == actual.to_a
  end  
end

def a_java_byte_array_for(ruby_string)
  JavaByteArrayMatcher.new(ruby_string.to_java_bytes)
end
