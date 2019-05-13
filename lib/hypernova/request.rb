require "hypernova/faraday_request"
require "hypernova/http_client_request"

class Hypernova::Request
  def initialize(jobs, opts)
    @jobs = jobs
    @opts = opts
  end

  def body
    post.body
  end

  private

  attr_reader :jobs, :opts

  def payload
    {
      :body => jobs,
      :idempotent => true,
      :request_format => :json,
      :response_format => :json,
    }
  end

  def post
    puts "Hypernova::Request:> #{opts}"
    if Hypernova.configuration.http_client
      Hypernova::HttpClientRequest.post(payload, @opts)
    else
      Hypernova::FaradayRequest.post(payload, @opts)
    end
  end
end
