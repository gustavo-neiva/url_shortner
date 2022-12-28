module UrlShortener
  module UseCases
    class ScrapeUrl
      def self.build
        all_urls = UrlShortener::Repositories::AllUrls.build
        scraper = UrlShortener::Services::TitleScraper.new
        new(all_urls: all_urls, scraper: scraper)
      end

      def initialize(all_urls:, scraper:)
        @all_urls = all_urls
        @scraper = scraper
      end

      def execute(long_url:)
        url = long_url
        uri = URI.parse(long_url)

        if(!uri.scheme)
          url = "https://#{url}"
        end

        title = @scraper.scrape(url)

        @all_urls.add_title(long_url: long_url, title: title)
      end
    end
  end
end