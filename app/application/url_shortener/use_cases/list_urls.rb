module UrlShortener
  module UseCases
    class ListUrls
      def self.build
        all_urls = UrlShortener::Repositories::AllUrls.build
        new(all_urls: all_urls)
      end

      def initialize(all_urls:)
        @all_urls = all_urls
      end

      def execute()
        urls = @all_urls.list_urls()
        urls.to_hash
      end
    end
  end
end