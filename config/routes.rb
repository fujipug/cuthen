Rails.application.routes.draw do

  

  devise_for :users, controllers: { sessions:     "users/sessions",
                                    omniauth_callbacks:  "users/omniauth_callbacks",
                                    #registrations: "users/registrations",
                                    confirmations: "users/confirmations" }
  as :user do
    get "/users/edit" => "devise/registrations#edit"#, :as => 'edit_user_registration'
    put "/users"      => "devise/registrations#update"#, :as => 'user_registration'
    delete "/users"   => "devise/registrations#destroy"
    get "/login"      => "users/sessions#new"
    post "/login"     => "users/sessions#create"
    get "/signup"     => "devise/registrations#new"
    delete "/logout"  => "users/sessions#destroy"
    #get '/confirmation-to-root' => 'visitors/index', as: 'confirmation_to_root'

  end

  get "users/" => "users#index", as: :users_path
  get "users/:id/" => "users#show", as: :user_path
  get "profile/" => "users#profile", as: :profile
  get "profile/edit" => "users#profile_edit", as: :profile_edit
  patch "profile/edit" => "users#profile_update" 
  #autocomplete and typeahead routes

  root to: 'visitors#index'
  get 'dashboards/dashboard', as: :dashboard
  get 'create_itineraries/create_itinerary'
  get 'add_events/add_event'

  get 'search/results/' => 'search#results', as: :search_results
  get 'search/index'
  get 'user_data/' => 'search#user_data', as: :search_user_data
  get 'itinerary_data/' => 'search#itinerary_data', as: :search_itinerary_data
  put 'event_data/:id' => 'events#replace_event_data', as: :replace_event_data

  get 'visitors/index'
  get 'visitors/welcome'
  resources :groups
  get 'pages/about'

  resources :itineraries
  get 'itinerary/:id/delete' => 'itineraries#delete', as: :itineraries_delete
  get 'itinerary/:id/' => 'itineraries#destroy', as: :itineraries_destroy
  get 'calendar_data/' => 'itineraries#calendar_data', as: :calendar_data
  get 'calendar_data/:id/' => 'itineraries#calendar_data2', as: :calendar_data2
  get 'calendar_data/:itinerary_id/:event_id' => 'itineraries#calendar_data3', as: :calendar_data3
  get 'users_typeahead/' => 'users#typeahead', as: :users_typeahead
  
  resources :itineraries do
    post 'determine_time'    
    resources :events do
      resources :votes
    end
  end
  
  resources :events do
    resources :votes
  end
  #get 'event/:id/delete' => 'events#delete', as: :events_delete
  #get 'event/:id/' => 'events#destroy', as: :events_destroy

  #get 'itinerary/:itinerary_id/events' => 'events#index', as: :events_path
  #post 'itinerary/:itinerary_id/events' => 'events#create'
  #get 'itinerary/:itinerary_id/event/new' => 'events#new', as: :new_event_path
  #get 'itinerary/:itinerary_id/event/:id/edit' => 'events#edit', as: :edit_event_path
  #get 'itinerary/:itinerary_id/event/:id' => 'events#show', as: :event_path
  #patch 'itinerary/:itinerary_id/event/:id' => 'events#update'
  #put 'itinerary/:itinerary_id/event/:id' => 'events#update'
  get 'itineraries/:itinerary_id/event/:id/delete' => 'events#delete', as: :itinerary_events_delete
  get 'itineraries/:itinerary_id/event/:id' => 'events#destroy', as: :itinerary_events_destroy

end