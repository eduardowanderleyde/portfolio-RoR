Rails.application.routes.draw do
  get 'contact_messages/new'
  get 'contact_messages/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#home'

  resources :projects
  resources :experiences
  resources :educations
  resources :contact_messages, only: [:new, :create]

  get 'about', to: 'pages#about', as: :about
  get 'portfolio', to: 'projects#index', as: :portfolio
  get 'contact', to: 'contact_messages#new', as: :contact
  get 'download_cv', to: 'pages#download_cv', as: :download_cv

  # Área administrativa
  namespace :admin do
    resources :projects
    resources :contact_messages, only: [:index, :show, :destroy]
    get 'dashboard', to: 'dashboard#index'
  end
end
