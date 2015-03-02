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


  resources :itineraries
  get 'itinerary/:id/delete' => 'itineraries#delete', as: :itineraries_delete
  get 'itinerary/:id/' => 'itineraries#destroy', as: :itineraries_destroy

  resources :events
  get 'event/:id/delete' => 'events#delete', as: :events_delete
  get 'event/:id/' => 'events#destroy', as: :events_destroy
end