module UrlShortener
  module UseCases
    class ScrapeUrl
      def self.build
        all_urls = UrlShortener::Repositories::AllUrls.build
        scraper = UrlShortener::Services::TitleScraper.new
        url = UrlShortener::Domain::Url
        new(all_urls: all_urls, scraper: scraper, url: url)
      end

      def initialize(all_urls:, scraper:, url:)
        @all_urls = all_urls
        @scraper = scraper
        @url = url
      end

      def execute(long_url:)
        schemed_url = @url.url_scheme(long_url)

        title = @scraper.scrape(schemed_url)

        @all_urls.add_title(long_url: long_url, title: title)
      end
    end
  end
end