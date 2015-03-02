Rails.application.routes.draw do


  devise_for :auth_users, controllers: { sessions:     "auth_users/sessions"}
  as :auth_user do
    get "/auth_users/edit" => "devise_invitable/registrations#edit", :as => 'edit_user_registration'
    put "/auth_users"      => "devise_invitable/registrations#update", :as => 'user_registration'
    delete "/auth_users"   => "devise_invitable/registrations#destroy"
    get "/login"      => "auth_users/sessions#new"
    post "/login"     => "auth_users/sessions#create"
    delete "/logout"  => "auth_users/sessions#destroy"
    get "/invite"     => "auth_users/invitations#new"
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