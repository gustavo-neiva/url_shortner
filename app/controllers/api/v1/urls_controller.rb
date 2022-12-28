require 'uri'

module Api
  module V1
    class UrlsController < BaseController
      before_action :set_url, only: %i[ show update destroy ]

      # GET /urls
      def index
        @urls = Url.all

        render json: @urls
      end

      # GET /urls/1
      def show
        render json: @url
      end

      # POST /urls
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

      # PATCH/PUT /urls/1
      def update
        if @url.update(url_params)
          render json: @url
        else
          render json: @url.errors, status: :unprocessable_entity
        end
      end

      # DELETE /urls/1
      def destroy
        @url.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_url
          @url = Url.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def url_params
          params.require(:url).permit(:url)
        end
    end
  end
end