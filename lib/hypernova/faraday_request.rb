require "hypernova/faraday_connection"

class Hypernova::FaradayRequest
  def self.post(payload, opts = {})
    Hypernova::FaradayConnection.build(opts).post do |request|
      request.url(Hypernova::BatchUrlBuilder.path)
      request.headers["Content-Type"] = "application/json"
      request.body = payload[:body].to_json
    end
  end
end
