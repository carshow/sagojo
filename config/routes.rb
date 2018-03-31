Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  get "articles/recommend" => "articles#recommend"
  get "beginner" => "articles#beginner"
  resources :articles

  get "showlabo/latest" => "sholabos#index"
  get "FAQ" => "articles#faq"
  get "business" => "articles#business"
  get "rules" => "users#rules"
  get "privacy" => "users#privacy"
  get "identify" => "users#identify"
end
