$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'rubygems'
require 'bundler/setup'
require 'rspec/expectations'
require 'vcr'
require 'webmock'
require 'cucumber/api_steps'
require 'swagger_resource'
 
VCR.configure do |c|
  c.default_cassette_options = { :record => :new_episodes, :erb => true }
  c.cassette_library_dir = 'features/support/fixtures/cassettes'
  c.hook_into :webmock
end
 
VCR.cucumber_tags do |t|
  t.tag '@vcr', :use_scenario_name => true
end
