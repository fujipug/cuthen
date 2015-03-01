Rails.application.routes.draw do

  devise_for :auth_users
  get 'groups/group'

  root to: 'visitors#index'
  get 'dashboards/dashboard'
  get 'create_itineraries/create_itinerary'
  get 'add_events/add_event'
  get 'search/results'
  get 'search/index'
  get 'visitors/index'
  get 'visitors/welcome'

  resources :itineraries
  get 'itinerary/:id/delete' => 'itineraries#delete', as: :itineraries_delete
  get 'itinerary/:id/' => 'itineraries#destroy', as: :itineraries_destroy
end