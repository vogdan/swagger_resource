require 'faraday'
require 'json'
require 'swagger_resource/configuration'
class SwaggerResource
  attr_accessor :specification

  def self.configure
    @config ||= Configuration.new({})
    yield(@config) if block_given?
    @config
  end

  def initialize(specification, config={})
    @config = self.class.configure.as_json.merge(config)

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
    path = api["path"]
    path = path.gsub(/^\//,"")
    r = @conn.get do |req|
      #@conn.url_prefix.path
      req.url path#, :page => 2
      req.params['api_key'] = @config["api_key"]
    end
    r.body
  end
  
  def get_info(meth)
    api, operation = @methods[meth.to_sym]
    operation["summary"]
  end  
end
