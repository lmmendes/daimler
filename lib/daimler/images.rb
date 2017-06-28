module Daimler
  class Images
    def initialize(client, options = {})
        @client = client
    end

    def find(vin, options = {})
      @client.request(:get, "image/v1/vehicles/#{vin}/vehicle")
    end
  end
end
