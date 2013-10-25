CRM::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :create
      resource :session, only: [:create, :destroy]
    end
    get '/status', to: 'info#index'
    resources :sms_notifications, only: [:create]
  end
end
