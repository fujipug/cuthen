Rails.application.routes.draw do
  get 'search/index'

  get 'search/results'

  root to: 'visitors#index'
  get 'dashboards/dashboard'
  get 'create_iteneraries/create_itenerary'
  get 'add_events/add_event'
end