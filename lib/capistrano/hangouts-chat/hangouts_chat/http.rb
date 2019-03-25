require 'net/http'
require 'json'

module HangoutsChat
  class Sender
    class APIError < StandardError; end

    class HTTP
      def initialize(url)
        @uri = URI(url)
        @req = Net::HTTP::Post.new(@uri)
        @req['Content-Type'] = 'application/json'
      end

      def post(payload)
        @req.body = payload.to_json

        Net::HTTP.start(@uri.hostname, @uri.port, :ENV, use_ssl: true) do |http|
          http.request(@req)
        end
      end
    end
  end
end
