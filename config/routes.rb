Rails.application.routes.draw do

  namespace :admin do
    resources :dashboard
    resources :buildings
    resources :courses
    resources :lessons
    resources :rooms
    resources :students
    resources :teachers

    root to: 'dashboard#index'
  end

  resources :buildings
  resources :courses
  resources :lessons
  resources :rooms
  resources :students
  resources :teachers

  root to: 'buildings#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
