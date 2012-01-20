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

Then /^I receive an error message reporting that "([^"]*)" is an invalid application context$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I don't have Spring MVC's supporting classes on my classpath$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I receive an error message reporting the classes that cannot be found$/ do
  pending # express the regexp above with the code you wish you had
end
