Rails.application.routes.draw do
  get 'messagesrails/g'
  get 'messagesrails/controller'
  get 'messagesrails/messages'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'

  post "/users", to: 'users#create'
  post "/login", to: 'users#login'
  get "/validate", to: 'users#validate'
  delete "/users/delete", to: 'users#destroy'

  get "/deliveries", to: 'deliveries#index'
  post "/my_deliveries", to: 'deliveries#my_deliveries'
  post "/gdeliveries", to: 'deliveries#gcreate'
  post "/rdeliveries", to: 'deliveries#rcreate'

  get "/ads", to: 'ads#index'
  get "/my_ads", to: 'ads#my_ads'
  post "/ads", to: 'ads#create'
  post "/ads/filter", to: 'ads#filter_ads'
  patch "/ads/update_active", to: 'ads#update_active'
  delete "/ads/:id", to: 'ads#destroy'
end
