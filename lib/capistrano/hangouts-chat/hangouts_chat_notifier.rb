require 'net/http'
require 'json'

class GoogleAPIError < StandardError
  def initialize(response)
    msg = "HTTP #{response.code} #{response.msg}\n"
    msg += "Body:\n#{response.body}"
    super(msg)
  end
end

class HangoutsChatNotifier
  attr_reader :webhook_url

  def initialize(args = {})
    @webhook_url = args.fetch(:webhook_url)
  end

  def notify(message)
    send_request(message) if message
  end

  private

  def send_request(message)
    uri = URI(@webhook_url)
    req = Net::HTTP::Post.new(uri)
    req['Content-Type'] = 'application/json'
    req.body = message.to_json

    response = Net::HTTP.start(uri.hostname, uri.port, :ENV, use_ssl: true) do |http|
                 http.request(req)
               end
    raise GoogleAPIError, response unless response.is_a?(Net::HTTPSuccess)
  end
end
