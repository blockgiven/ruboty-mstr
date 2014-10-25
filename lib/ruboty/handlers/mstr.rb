require "ruboty/mstr/actions/mstr"

module Ruboty
  module Handlers
    class Mstr < Base
      on /(mstr|飯テロ) ?(?<count>\d+)?/, name: 'mstr', description: '飯テロ'

      def mstr(message)
        Ruboty::Mstr::Actions::Mstr.new(message).call
      end
    end
  end
end
