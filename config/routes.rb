Rails.application.routes.draw do
  root 'static_pages#home'
  get '/login', to: 'static_pages#login'
  post '/login', to: 'sessions#create'
  get '/lists/archive/:id', to: 'lists#archive', as: 'archive'
  get '/archived', to: 'lists#show_archived'
  get '/lists/unarchive/:id', to: 'lists#unarchive', as: 'unarchive'
  resources 'lists'
  resources 'users'
  get '/lists/:id/tasks', to: 'tasks#new', as: 'new_task'
  post '/lists/:id/tasks', to: 'tasks#create', as: 'tasks'
  get '/lists/:id/tasks/:task', to: 'tasks#edit', as: 'edit_task'
  patch '/lists/:id/tasks/:task', to: 'tasks#update'
  delete '/lists/:id/tasks/:task', to: 'tasks#destroy', as:'destroy_task'

end
