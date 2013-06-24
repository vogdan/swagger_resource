require 'json'
class SwaggerResource
  attr_accessor :specification

  def initialize(specification)
    @specification = specification
    @methods = self.class.get_methods(specification)
    super()
  end

  def self.from_json(json)
    specification = JSON.parse json
    new(specification)
  end

  def self.get_methods(specification)
    methods = {} 
    for api in specification["apis"]
      for operation in api["operations"]
        methods[operation["nickname"].to_sym] = [api, operation]
      end
    end
    methods
  end 

  def method_missing(meth, *args)
    api, operation = @methods[meth]
=begin
conn = Faraday.new(:url => 'http://sushi.com') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end 
=end    
     operation.inspect
  end
end
