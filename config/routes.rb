Rails.application.routes.draw do
  resources :pay_laters
  resources :card_details
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :drivers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :drivers do
        get :card_details
        post :add_order
        post :add_wallet_history
      end
    end
  end
  # get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
