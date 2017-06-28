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
      Images.new(self, options)
    end
  end
end
