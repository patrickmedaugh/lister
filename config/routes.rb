Rails.application.routes.draw do
  #login routes
  root 'static_pages#home'
  get '/login', to: 'static_pages#login'
  post '/login', to: 'sessions#create'
  #archive routes
  get '/lists/archive/:id', to: 'lists#archive', as: 'archive'
  get '/archived', to: 'lists#show_archived'
  get '/lists/unarchive/:id', to: 'lists#unarchive', as: 'unarchive'
  resources 'lists'
  resources 'users'
  #task CRUD
  get '/lists/:id/tasks', to: 'tasks#new', as: 'new_task'
  post '/lists/:id/tasks', to: 'tasks#create', as: 'tasks'
  get '/lists/tasks/:task_id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/lists/tasks/:task_id/edit', to: 'tasks#update'
  delete '/lists/tasks/:id', to: 'tasks#destroy', as: 'task'
  #status AJAX routes
  get '/pending/:id', to: 'statuses#pending'
  get '/completed/:id', to: 'statuses#completed'
  get '/incomplete/:id', to: 'statuses#incomplete'
  #filter AJAX routes
  get '/title/:id', to: 'filters#title'
  get '/status/:id', to: 'filters#status'
  get '/due-date/:id', to: 'filters#due_date'
end
