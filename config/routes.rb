Rails.application.routes.draw do
  root "static_pages#home"
  get "about" => "static_pages#about"
  get "help" => "static_pages#help"
  get "shop" => "static_pages#shop"
  get "product" => "static_pages#product"
  get "blog" => "static_pages#blog"
  get "blog_single" => "static_pages#blog_single"
  get "collection" => "static_pages#collection"

  devise_for :users
  resources :products

  namespace :admin do
    resources :dashboards
    root to: "dashboards#index"
    resources :products
    resources :users, except: [:new, :create, :show]
  end
end
