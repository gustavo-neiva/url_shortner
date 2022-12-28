class ScraperJob
  include Sidekiq::Job

  def perform(long_url)
    use_case = UrlShortener::UseCases::ScrapeUrl.build
    response = use_case.execute(long_url: long_url)
  end
end
