module Ellen
  module Handlers
    class GoogleImage < Base
      on /image (.+)/, description: "Search image from Google" do |message|
        if url = Ellen::GoogleImage::Client.new(query: message[1]).get
          say url
        end
      end

      on /animate (.+)/, description: "Search animation from Google" do |message|
        if url = Ellen::GoogleImage::Client.new(query: message[1], animated: true).get
          say url
        end
      end
    end
  end
end
