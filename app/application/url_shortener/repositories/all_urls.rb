module UrlShortener
  module Repositories
    class AllUrls
      def self.build
        encoder = UrlShortener::Services::UrlEncoderDecoder.new
        new(encoder: encoder)
      end

      def initialize(encoder:)
        @encoder = encoder
      end

      def find(long_url:)
        begin
          valid?(long_url: long_url)
          url_model = Url.find_by_url!(long_url)
          url = UrlShortener::Domain::Url.new(
            id: url_model.id,
            short_url: url_model.short_url,
            long_url: url_model.url,
          )
          url
        rescue ActiveRecord::RecordNotFound => e
          false
        end
      end

      def create(long_url:, base_url:)
        url_model = Url.new(url: long_url)
        url_model.save!
        
        url = UrlShortener::Domain::Url.new(
          id: url_model.id,
          long_url: url_model.url,
        )
        short_url = encode(id: url.id, base_url: base_url)
        url.short_url!(short_url)

        url_model.update!(
          url: url.long_url,
          short_url: url.short_url
        )
        
        url
      end

      def transaction
        Url.transaction do
          yield
        end
      end

      private


      def encode(id:, base_url:)
        encoded_string = @encoder.encode(id)
        short_url = "#{base_url}/#{encoded_string}"
      end

      def valid?(long_url:)
        @url = UrlShortener::Domain::Url.is_url?(long_url)
      end
    end
  end
end