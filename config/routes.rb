Rails.application.routes.draw do
  resources :pages
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :urls
    end
  end
end
