module UrlShortener
  module UseCases
    class DecodeSlug
      def self.build
        all_urls = UrlShortener::Repositories::AllUrls.build
        url = UrlShortener::Domain::Url
        new(all_urls: all_urls, url: url)
      end

      def initialize(all_urls:, url:)
        @all_urls = all_urls
        @url = url
      end

      def execute(slug:)
        long_url = @all_urls.find_by_slug(slug: slug)
        @url.url_scheme(long_url)
      end
    end
  end
end