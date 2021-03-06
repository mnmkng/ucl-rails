Rails.application.routes.draw do

  namespace :admin do
    resource :dashboard, controller: 'dashboard'
    resources :buildings
    resources :courses
    resources :lessons
    resources :rooms
    resources :students
    resources :teachers

    root to: 'dashboard#show'
  end

  resources :buildings
  resources :courses
  resources :lessons
  resources :rooms
  resources :students
  resources :teachers
  resource :lesson_list, controller: 'lesson_list'

  root to: 'buildings#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
