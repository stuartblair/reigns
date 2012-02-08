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

When /^I POST a body to (\S+) containing form data:\-$/ do |uri, table|
  @last_response = web_client.post(uri) do |request|
    table.hashes.each do |hash| 
      hash.each do |key, value|
        request.content = "#{key}=#{value}"
      end
    end
  end
end

Then /^I receive an HTTPResponse with a (\d+) code$/ do |status_code|
  @last_response.get_status.should eql status_code.to_i
end

Then /^I receive a response containing fields:\-$/ do |table|
  content = @last_response.get_content_as_string
  table.hashes.each do |hash|
    hash.each do |key, value|
      content.should =~ /#{Regexp.quote(key)}=#{Regexp.quote(value)}/
    end
  end
end
