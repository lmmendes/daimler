module Daimler
  class Client
    include Request

    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options = {})
      merge_options = Daimler.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        self.send("#{key}=", merge_options[key])
      end
    end

    def images(options = {})
      merge_options = { client: self }.merge( options )
      Images::Vehicle.new(merge_options)
    end
  end
end
