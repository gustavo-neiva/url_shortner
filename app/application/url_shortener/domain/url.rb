module UrlShortener
  module Domain
    class Url
      attr_reader :id, :long_url, :short_url
    
      def initialize(id:, long_url:, short_url: nil)
        @id = id
        @short_url = short_url
        @long_url = long_url
      end

      def short_url!(short_url)
        @short_url = short_url
      end

      def to_hash
        {
          long_url: self.long_url,
          short_url: self.short_url
        }
      end

      def self.is_url?(parameter)
        unless parameter =~ /^(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$/ix
          raise UrlShortener::Exceptions::InvalidUrlException.new("#{parameter} is an invalid Url")
        end
      end

    end
  end
end