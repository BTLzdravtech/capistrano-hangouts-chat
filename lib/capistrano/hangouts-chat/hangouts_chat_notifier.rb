require_relative 'hangouts_chat/http'
require_relative 'hangouts_chat/exceptions'

class HangoutsChatNotifier
  attr_reader :webhook_url

  def initialize(args = {})
    @webhook_url = args.fetch(:webhook_url)
  end

  def notify(message)
    send_request(message) if message
  end

  private

  # def simple(text)
  #   payload = { text: text }
  #   send_request(payload)
  # end

  # def card(header, sections)
  #   payload = { cards: [header: header, sections: sections] }
  #   send_request(payload)
  # end

  def send_request(message)
    response = HTTP.new(@webhook_url).post message
    raise APIError, response unless response.is_a?(Net::HTTPSuccess)
    response
  end
end
