When /^I GET (\S*)$/ do |uri|
  @last_response = web_client.get(uri) do |request|
  end
end

When /^I PUT (\S*)$/ do |uri|
  @last_response = web_client.put(uri) do |request|
  end
end

When /^I POST (\S*)$/ do |uri|
  @last_response = web_client.post(uri) do |request|
  end
end

When /^I DELETE (\S*)$/ do |uri|
  @last_response = web_client.delete(uri) do |request|
  end
end

When /^I POST a body to (\S*) containing JSON data: (.*)$/ do |uri, data|
  @last_response = web_client.post(uri) do |request|
    request.add_header("Content-Type", "application/json")
    request.content = data
  end
end

Then /^I receive a response containing JSON data: (.*)$/ do |data|
  @last_response.get_content_as_string.should have_the_same_json_representation_as(data)
end

Then /^I receive a HTTPResponse with a (\d+) code$/ do |status_code|
  @last_response.get_status.should eql status_code.to_i
end

