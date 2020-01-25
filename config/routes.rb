Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # LIST TASKS
  get 'tasks', to: 'tasks#index', as: :tasks

  # CREATE
  ## GET/DISPLAY the empty HTML form
  get 'tasks/new', to: 'tasks#new', as: :new_task
  ## POST/SUBMIT this form
  post 'tasks', to: 'tasks#create'

  # UPDATE
  ## GET/DISPLAY the empty HTML form
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  ## POST/SUBMIT this form
  patch 'tasks/:id', to: 'tasks#update'

  # DISPLAY ONE TASK
  get 'tasks/:id', to: 'tasks#show', as: :task

  # DELETE
  delete 'tasks/:id', to: 'tasks#destroy'
end
