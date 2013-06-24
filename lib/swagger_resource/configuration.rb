require 'json'
class SwaggerResource
  class Configuration < Hash
    def initialize(*a)
      super
    end

    def as_json(options=nil); self end
  end
end
