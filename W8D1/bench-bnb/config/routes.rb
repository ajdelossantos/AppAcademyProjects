Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    # routes go in here
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
  end

  root "static_pages#root"
end
