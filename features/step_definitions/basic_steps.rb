When(/^a valid api_key is configured$/) do
  SwaggerResource.configure do |c|
    c['api_key'] = begin
      ENV["FEDAPI_APIKEY"] || 
        raise("until we get a test server set up, this requires a valid fedapi api_key")
    end
  end
end

When(/^I create SwaggerResource '(.*)' from json:$/) do |varname, json|
  instance_variable_set varname, SwaggerResource.from_json(json)
end

When /calling '(.*)'/ do |code|
  VCR.use_cassette(:working) do
    @result = eval(code)
  end
end

Then(/^the response should contain "(.*?)"$/) do |string|
  @result.should include(string)
end

Then(/^the JSON response should be:$/) do |json|                                                 
  #expect(@result).to eq(json)
  raise "error: #{@result}" unless @result == json
end

Then(/^the response should be:$/) do |string|                                                 
  raise "error: #{@result}" unless @result == string.strip
end
