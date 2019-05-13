require "hypernova/request"
require "hypernova/response"

class Hypernova::ParsedResponse
  def initialize(jobs, opts = {})
    @jobs = jobs
    @opts = opts
  end

  def body
    response.parsed_body
  end

  private

  attr_reader :jobs, :opts

  def request
    Hypernova::Request.new(jobs, opts)
  end

  def response
    Hypernova::Response.new(request)
  end
end
