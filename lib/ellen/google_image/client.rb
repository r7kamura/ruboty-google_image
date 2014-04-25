require "faraday"
require "faraday_middleware"

module Ellen
  module GoogleImage
    class Client
      GOOGLE_IMAGE_API_URL = "http://ajax.googleapis.com/ajax/services/search/images"

      attr_reader :options

      def initialize(options)
        @options = options
      end

      def get
        resource["unescapedUrl"] if resource
      rescue => exception
        Ellen.logger.error("Error: #{self}##{__method__} - #{exception}")
        nil
      end

      private

      def resource
        @resource ||= begin
          if data = response.body["responseData"]
            if results = data["results"]
              results.sample
            end
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
          rsz: 8,
          safe: "active",
          v: "1.0",
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
