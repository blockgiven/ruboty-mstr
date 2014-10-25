require 'json'
require 'open-uri'

module Ruboty
  module Mstr
    module Actions
      class Mstr < Ruboty::Actions::Base
        MSTR_ENDPOINT_URL = 'https://mstr.in/api/photos.json'

        def call
          message.reply((mstr_photos.sample(message[:count].to_i) + ['source: https://mstr.in/']).join($/))
        rescue
          message.reply("mstr fail: #{$!}")
        end

        def mstr_photos
          @mstr_photos ||= JSON.parse(OpenURI.open_uri(MSTR_ENDPOINT_URL).read)['photos'].map do |mstr|
            "https://pic.mstr.in/images/#{mstr['uid']}.jpg"
          end
        end
      end
    end
  end
end
