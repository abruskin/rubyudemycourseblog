Rails.application.routes.draw do
  resources :articles
  ###Edits from tutorial :
  #this routes to app/controllers/application_controller.rb <- ruby expects the 
  #"_controller.rb", that part doesn't need to be specified. We then define a method
  #within that file to handle the request. the #hello refers to the specific method. 
  root 'pages#home'

  #GET request to the about page; this is a static page so we'll use the pages controller as defined by the to line
  get 'about', to: 'pages#about'

  ###This was provided at launch: 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
