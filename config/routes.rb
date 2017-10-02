Rails.application.routes.draw do
  get 'tasks/index'

  get('/tasks', to: 'tasks#index', as: 'tasks')
  get('/tasks/new', to: 'tasks#new', as: 'new_task')
  post('/tasks', to: 'tasks#create')
  get('/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task')
  patch('/tasks/:id', to: 'tasks#update', as: 'update_task')
  get('/tasks/:id', to: 'tasks#show', as: 'task')
  patch('tasks/:id/complete', to: 'tasks#complete', as:'complete_task')
  # get('/tasks/:id/confirm_delete', to: 'tasks#confirm_delete', as: 'confirm_delete_task')
  # patch('tasks/:id/delete', to: 'tasks#delete', as: 'delete_task')
  delete('tasks/:id/delete', to: 'tasks#delete', as: 'delete_task')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
