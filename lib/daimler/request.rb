module Daimler
  module Request
    def request(method = :get, uri = '/', params = {}, &block)
      
      url = self.endpoint + uri
      params[:apikey] = self.api_key

      url += "?apikey=#{self.api_key}"

      response = nil
      begin
        response = RestClient.send(method, url, params)
      rescue RestClient::ExceptionWithResponse=> e
        $stderr.puts e.inspect
        raise e
      end

      response = JSON.parse(response)
      if block_given?
        block.call(response)
      else
        response
      end
    end
  end
end
