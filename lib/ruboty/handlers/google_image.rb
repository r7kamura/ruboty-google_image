module Ruboty
  module Handlers
    class GoogleImage < Base
      on /image( me)? (?<keyword>.+)/, name: "image", description: "Search image from Google"

      def image(message)
        if url = search(message[:keyword])
          message.reply(url)
        end
      end

      private

      def search(query)
        Ruboty::GoogleImage::Client.new(query: query).get
      end
    end
  end
end
