Rails.application.routes.draw do

  root to: "renegadefigs#index"

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'

  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/renegades", to: "renegadefigs#index"
  get "/new", to: "renegadefigs#new"
  get "renegadefigs/:id", to: "renegadefigs#show"
  get "/search", to: "renegadefigs#search"
  get "/checkout", to: "renegadefigs#checkout"
  get "/category", to: "renegadefigs#category"
  get "/incategory/:id", to: "renegadefigs#incategory"
  get "/about", to: "about#about"
  get "/about/:id", to: "about#show"

  resources :renegadefigs
  resources :cart, only: [:create, :destroy]

  scope "checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
