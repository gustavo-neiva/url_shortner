module Api
  module V1
    class UrlsController < BaseController
      def index
        @urls = Url.all

        render json: @urls
      end

      def show
        begin
          use_case = UrlShortener::UseCases::DecodeSlug.build
          long_url = use_case.execute(slug: slug_params[:slug])
          redirect_to long_url, allow_other_host: true
        rescue UrlShortener::Exceptions::UrlDoesNotExist => e
          Rails.logger.error(e.message)
          render json: { message: e.message }, status: :not_found
        end
      end

      def create
        begin
          base_url = request.base_url
          use_case = UrlShortener::UseCases::FindOrCreateEncodedUrl.build
          response = use_case.execute(url: url_params[:url], base_url: base_url)
          render json: response, status: :created
        rescue UrlShortener::Exceptions::InvalidUrlException => e
          Rails.logger.error(e.message)
          render json: { message: e.message }, status: :bad_request
        end
      end

      private

        def url_params
          params.require(:url).permit(:url)
        end

        def slug_params
          params.permit(:slug)
        end
    end
  end
end