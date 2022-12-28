module UrlShortener
  module Services
    class TitleScraper
      def scrape(url)
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        doc = Nokogiri::HTML(response.body)
        return doc.title
      end
    end
  end
end