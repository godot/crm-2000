CRM::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :create
      resource :session, only: [:create, :destroy]
    end
  end
end
