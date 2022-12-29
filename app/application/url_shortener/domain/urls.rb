module UrlShortener
  module Domain
    class Urls
      attr_reader :urls
    
      def initialize(urls:)
        @urls = urls
      end

      def to_hash
        array = []
        @urls.each do |url|
          array << url.to_hash
        end
        array
      end
    end
  end
end