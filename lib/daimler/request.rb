module Daimler
  module Request
    def request(method = :get, uri = '/', params = {}, &block)

      url = self.endpoint + uri
      querystring = {
        apikey: self.api_key
      }.merge(params)

      puts "URL: #{url}"

      response = nil
      begin
        response = RestClient::Request.execute(
          method: method,
          url: url,
          headers: { params: querystring },
          user_agent: self.user_agent,
          content_type: 'application/json'
        )
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
