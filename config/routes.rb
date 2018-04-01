Rails.application.routes.draw do
  devise_for :companies, controllers: {
  sessions:      'companies/sessions',
  passwords:     'companies/passwords',
  registrations: 'companies/registrations'
}
  devise_for :users, controllers: { registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  get "articles/recommend" => "articles#recommend"
  get "beginner" => "articles#beginner"
  resources :articles
  resources :companies, only: [:create, :new] do
    resources :articles, only: [:create, :new]
  end
  get "sholabos/latest" => "sholabos#index"
  get "FAQ" => "articles#faq"
  get "business" => "articles#business"
  get "rules" => "users#rules"
  get "privacy" => "users#privacy"
  get "identify" => "users#identify"
  resources :sholabos
end
