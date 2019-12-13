Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/users", to: 'users#create'
  post "/login", to: 'users#login'

  get "/deliveries", to: 'deliveries#index'
  post "/deliveries", to: 'deliveries#create'

  get "/ads", to: 'ads#index'
  get "/my_ads", to: 'ads#my_ads'
  post "/ads", to: 'ads#create'
  post "/ads/filter", to: 'ads#filter_ads'
  delete "/ads/:id", to: 'ads#destroy'
end
