Rails.application.routes.draw do

  root to: 'visitors#index'
  get 'dashboards/dashboard'
  get 'create_iteneraries/create_itenerary'
  get 'add_events/add_event'
  get 'search/results'
  get 'search/index'

end