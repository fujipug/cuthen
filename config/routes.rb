Rails.application.routes.draw do

  devise_for :users, controllers: { sessions:     "users/sessions",
                                    omniauth_callbacks:  "users/omniauth_callbacks" }
  as :user do
    get "/users/edit" => "devise/registrations#edit"#, :as => 'edit_user_registration'
    put "/users"      => "devise/registrations#update"#, :as => 'user_registration'
    delete "/users"   => "devise/registrations#destroy"
    get "/login"      => "users/sessions#new"
    post "/login"     => "users/sessions#create"
    get "/signup"     => "devise/registrations#new"
    delete "/logout"  => "users/sessions#destroy"
  end

  root to: 'visitors#index'
  get 'dashboards/dashboard'
  get 'create_itineraries/create_itinerary'
  get 'add_events/add_event'
  get 'search/results'
  get 'search/index'
  get 'visitors/index'
  get 'visitors/welcome'
  get 'groups/group'
  get 'pages/about'

  #autocomplete and typeahead routes
  get 'users/autocomplete_array' => 'users#autocomplete_array', as: :users_autocomplete_array

  resources :itineraries
  get 'itinerary/:id/delete' => 'itineraries#delete', as: :itineraries_delete
  get 'itinerary/:id/' => 'itineraries#destroy', as: :itineraries_destroy

  resources :itineraries do
    resources :events
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