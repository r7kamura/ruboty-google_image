require "faraday"
require "faraday_middleware"

module Ruboty
  module GoogleImage
    class Client
      GOOGLE_IMAGE_API_URL = "https://www.googleapis.com/customsearch/v1"

      attr_reader :options

      def initialize(options)
        @options = options
      end

      def get
        resource["link"] if resource
      rescue => exception
        Ruboty.logger.error("Error: #{self}##{__method__} - #{exception}")
        nil
      end

      private

      def resource
        @resource ||= begin
          if items = response.body["items"]
            items.sample
          end
        end
      end

      def response
        connection.get(url, params)
      end

      def url
        GOOGLE_IMAGE_API_URL
      end

      def params
        default_params.merge(given_params).reject {|key, value| value.nil? }
      end

      def given_params
        {
          q: options[:query],
        }
      end

      def default_params
        {
          searchType: 'image',
          safe: 'high',
          fields: 'items(link)',
          cx: ENV['GOOGLE_CSE_ID'],
          key: ENV['GOOGLE_CSE_KEY']
        }
      end

      def connection
        Faraday.new do |connection|
          connection.adapter :net_http
          connection.response :json
        end
      end
    end
  end
end
