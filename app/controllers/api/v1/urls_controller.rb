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
          validate_url()
          if Url.exists?(url: params[:url])
            render json: { short_url: }
          else
          end

        #that should be a unique kind of error class for this business logic
        rescue StandardError => e
          Rails.logger.error(e.message)
          Rails.logger.error(e.backtrace.join("\n"))
          render json: { message: e.message }, status: :bad_request
        end

        # if @url.save
        #   render json: @url, status: :created, location: @url
        # else
        #   render json: @url.errors, status: :unprocessable_entity
        # end
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
          params.require(:url).permit(:url, :short_url)
        end

        def validate_url
          raise StandardError.new("Invalid URL") unless params[:url] =~ /\A#{URI::regexp}\z/
        end
    end
  end
end