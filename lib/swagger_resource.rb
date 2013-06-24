require 'faraday'
require 'json'
class SwaggerResource
  attr_accessor :specification

  def initialize(specification)
    @specification = specification
    @methods = self.class.get_methods(specification)
    @method_chain = []
    @conn = Faraday.new(:url => specification['basePath']) do |f|
      #faraday.request  :url_encoded             # form-encode POST params
      f.response :logger                  # log requests to STDOUT
      f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
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
    r = @conn.get do |req|
      req.url api["path"] #, :page => 2
      req.params['api'] = "foo"
    end
    r.body
  end
end
