module Ellen
  module Handlers
    class GoogleImage < Base
      on /image( me)? (.+)/, name: "image", description: "Search image from Google"

      def image(message)
        if url = search(message[2])
          robot.say url
        end
      end

      private

      def search(query)
        Ellen::GoogleImage::Client.new(options.merge(query: query)).get
      end
    end
  end
end
