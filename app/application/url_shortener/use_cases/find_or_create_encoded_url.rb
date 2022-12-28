module UrlShortener
  module UseCases
    class FindOrCreateEncodedUrl
      def self.build
        all_urls = UrlShortener::Repositories::AllUrls.build
        worker = ScraperJob
        new(all_urls: all_urls, worker: worker)
      end

      def initialize(all_urls:, worker:)
        @all_urls = all_urls
        @worker = worker
      end

      def execute(url:, base_url:)
        url_domain_object = @all_urls.find(long_url: url)

        unless url_domain_object
          @all_urls.transaction do
            url_domain_object = @all_urls.create(long_url: url, base_url: base_url)
          end
        end

        unless url_domain_object.page_title
          @worker.perform_async(url_domain_object.long_url)
        end

        return url_domain_object.to_hash
      end

    end
  end
end