require 'net/http/response'

module HangoutsChat
  class Sender
    class APIError < StandardError
      def initialize(response)
        msg = "HTTP #{response.code} #{response.msg}\n"
        msg += "Body:\n#{response.body}"
        super(msg)
      end
    end
  end
end
