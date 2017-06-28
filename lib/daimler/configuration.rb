module Daimler
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :user_agent].freeze

    VALID_OPTION_KEYS = [:api_key].freeze

    VALID_CONFIG_KEYS = VALID_CONNECTION_KEYS + VALID_OPTION_KEYS

    DEFAULT_END_POINT = "https://api.mercedes-benz.com/"

    DEFAULT_USER_AGENT = "Mozilla/5.0 (compatible; Daimler a Ruby API Client/#{Daimler::VERSION}; +https://github/lmmendes/daimler)"

    DEFAULT_API_KEY = nil

    attr_accessor *VALID_CONFIG_KEYS

    def reset
      self.endpoint = DEFAULT_END_POINT
      self.api_key  = DEFAULT_API_KEY
      self.user_agent = DEFAULT_USER_AGENT
    end

    def options
      Hash[ *VALID_CONFIG_KEYS.map{ |key| [key, send(key)] }.flatten ]
    end

    def configure
      yield self
    end

    def self.extended(base)
      base.reset
    end
  end
end
