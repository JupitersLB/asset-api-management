Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboards', to: 'dashboards#index', as: 'dashboards'

  patch '/dashboards', to: 'dashboards#wallet', as: 'wallet'

  post '/post_query_v2', to: 'dashboards#query_v2', as: 'query2'
  post '/post_query_v1', to: 'dashboards#query_v1', as: 'query1'
  post '/new_order', to: 'dashboards#new_order', as: 'new_order'


  get '/websocket', to: 'dashboards#websocket', as: 'websocket'

end
