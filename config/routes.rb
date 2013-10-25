CRM::Application.routes.draw do

  namespace :api do
    get '/status', to: 'info#index'
  end

end
