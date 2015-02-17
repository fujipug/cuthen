Rails.application.routes.draw do

  get 'groups/group'

  root to: 'visitors#index'
  get 'dashboards/dashboard'
  get 'create_itineraries/create_itinerary'
  get 'add_events/add_event'
  get 'search/results'
  get 'search/index'

end