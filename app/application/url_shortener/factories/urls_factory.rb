module UrlShortener
  module Factories
    class UrlsFactory
      def build_urls(urls_list)
        urls = urls_list.map do |url|
          params = {
            long_url: url.dig("url"),
            short_url: url.dig("short_url"),
            id: url.dig("id"),
            page_title: url.dig("page", "title")
          }
          UrlShortener::Domain::Url.new(**params)
        end
        UrlShortener::Domain::Urls.new(urls: urls)
      end
    end
  end
end