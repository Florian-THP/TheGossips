Rails.application.routes.draw do
  resources :gossips do
    resources :comments
    resources :likes, only: [ :create, :destroy ]
  end

  resources :sessions, only: [ :new, :create, :destroy ]
  resources :users

  # Les routes `get` en dessous
  get "city/cityview/:id", to: "city#cityview"
  get "show/:user", to: "static_profil#profil"
  get "static_welcome/welcome/:hide", to: "static_welcome#welcome"
  get "gossip/:id", to: "static_gossip#gossip"
  get "static_contact/contact"
  get "static_team/team"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
