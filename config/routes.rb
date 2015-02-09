Rails.application.routes.draw do
  devise_for :users, skip: [ :sessions ]
  as :user do
    post '/api/login' => 'sessions#create'
    delete '/api/logout' => 'sessions#destroy'
  end

  
  namespace :api do
    resources :categories, only: [ :index ]
    resources :edges, only: [ :index, :create ]
    resources :users, only: [ :index ]
  end  
end
