Given /^I host a spring mvc application with context location of "([^"]*)"$/ do |context_location|
  host_application(context_location)
end

Given /^the application will respond to get requests for the uri "([^"]*)"$/ do |uri|
  # Because it will - see the reference_apps/valid_app folder
  # Somewhat tricky to do this step with a real J2EE app supplied as reference.
  # Need to think of something better here to verify that the J2EE app *is* able to respond to the URI
end

When /^I (GET|PUT|POST|DELETE) "([^"]*)"$/ do |method, uri|
  @last_response = send_request(method, uri)
end

Then /^I recieve an HTTPResponse with a (\d+) code$/ do |status_code|
  @last_response.get_status.should eql status_code.to_i
end

Given /^the application contains a spring bean with the id "([^"]*)"$/ do |bean_id|
  # Because it will - see the reference_apps/valid_app folder
  # Somewhat tricky to do this step with a real J2EE app supplied as reference.
  # Need to think of something better here to verify that the J2EE app *does* contain the requested 
  # bean that isn't actually using the functionality tested.
end

Given /^I request the bean "([^"]*)"$/ do |bean_id|
  @last_response = lookup_bean(bean_id)
end

Then /^I recieve a non\-nil object from my application context$/ do
  @last_response.should_not be_nil
end
