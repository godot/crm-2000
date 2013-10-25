CRM::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: :create
    resources :notifications, only: :create
    resource :session, only: [:create, :destroy]

    get '/status', to: 'info#index'
    resources :sms_notifications, only: [:create]
  end
end
