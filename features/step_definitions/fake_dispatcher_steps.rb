Given /^I host a spring mvc application with context location of "([^"]*)"$/ do |context_location|
  host_application(context_location)
end

Given /^the application will respond to (\S*) requests for the uri (\S*)$/ do |method, uri|
  # Because it will - see the reference_apps/valid_app folder
  # Somewhat tricky to do this step with a real J2EE app supplied as reference.
  # Need to think of something better here to verify that the J2EE app *is* able to respond to the URI
end

Given /^the application contains a spring bean with the id "([^"]*)"$/ do |bean_id|
  # Because it will - see the reference_apps/valid_app folder
  # Somewhat tricky to do this step with a real J2EE app supplied as reference.
  # Need to think of something better here to verify that the J2EE app *does* contain the requested 
  # bean that isn't actually using the functionality tested.
end

When /^I request the bean "([^"]*)"$/ do |bean_id|
  @last_response = lookup_bean(bean_id)
end

When /^I (GET|PUT|POST|DELETE) (\S*)$/ do |method, uri|
  @last_response = dispatcher.send(method.downcase, uri) do |request|
  end
end

When /^I POST a body to (\S+) containing form data:\-$/ do |uri, table|
  @last_response = dispatcher.post(uri) do |request|
    table.hashes.each do |hash| 
      hash.each do |key, value|
        request.content << "#{key}=#{value}"
      end
    end
  end
end

Then /^I receive an HTTPResponse with a (\d+) code$/ do |status_code|
  @last_response.get_status.should eql status_code.to_i
end

Then /^I receive a non\-nil object from my application context$/ do
  @last_response.should_not be_nil
end

Then /^I receive a response containing fields:\-$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
