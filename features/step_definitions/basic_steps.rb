When(/^I create SwaggerResource '(.*)' from json:$/) do |varname, json|
  instance_variable_set varname, SwaggerResource.from_json(json)
end

When /calling '(.*)'/ do |code|
  @result = eval(code)
end

Then(/^the JSON response should be:$/) do |json|                                                 
  #expect(@result).to eq(json)
  raise "error: #{@result}" unless @result == json
end

Then(/^the response should be:$/) do |string|                                                 
  raise "error: #{@result}" unless @result == string.strip
end
