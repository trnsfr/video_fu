module ActionView
  module Helpers
    module TagHelper

      def video_fu(url, options={})
        VideoFu.new(url).klass.to_s
      end

    end
  end
end
