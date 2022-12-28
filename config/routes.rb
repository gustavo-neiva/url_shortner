Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :urls
    end
  end
  get '/:slug', to: 'api/v1/urls#show'
end
