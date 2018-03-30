Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  get "articles/recommend" => "articles#recommend"
  get "beginner" => "articles#beginner"
  resources :articles

  get "showlabo/latest" => "sholabos#index"
  get "FAQ" => "articles#faq"
  get "business" => "articles#business"
end
