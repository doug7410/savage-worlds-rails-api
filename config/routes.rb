Rails.application.routes.draw do
 namespace :api do
  resources :edges, only: [ :index ]
 end  
end
