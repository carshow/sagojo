Rails.application.routes.draw do
  devise_for :companies, controllers: {
  sessions:      'companies/sessions',
  registrations: 'companies/registrations'
}
  devise_for :users, controllers: { registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'articles#index'

  # for シゴト views
  get "articles/recommend" => "articles#recommend"
  get "articles/latest" => "articles#latest"
  get "articles/popular" => "articles#popular"
  get "articles/wanted" => "articles#wanted"
  get "articles/finished" => "articles#finished"

  # for searching tags function
  get "articles/category/:id" => "articles#category", as: "articles_category"

  # for beginner view
  get "beginner" => "headerlinks#beginner"
  get "FAQ" => "headerlinks#faq"
  get "business" => "headerlinks#business"


  resources :articles, except: [:create, :new]
  resources :companies, only: [:create, :new] do
    resources :articles, only: [:create, :new]
  end

  # for like funcion
  post '/likes/:article_id', to: 'clips#create', as: 'like'
  delete '/likes/:article_id', to: 'clips#destroy', as: 'dislike'

  get "sholabos/latest" => "sholabos#latest"
  get "sholabos/popular" => "sholabos#popular"

  get "rules" => "users#rules"
  get "privacy" => "users#privacy"
  get "identify" => "users#identify"
  get "user/:id/favorite_list" => "users#favorite_list", as: "favorite_list"
  resources :sholabos, only: [:create, :new, :show]
end
