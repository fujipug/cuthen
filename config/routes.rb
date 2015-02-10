Rails.application.routes.draw do
  root to: 'visitors#index'
  get 'dashboards/dashboard'
  get 'create_iteneraries/create_itenerary'
end
