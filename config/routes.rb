Rails.application.routes.draw do
  devise_for :users, path: 'api/users', controllers: {
    registrations: "api/users",
    sessions: "api/sessions"} do
    get "login", to: "sessions#new"
  end
  root "static_pages#root"
  get "admin", to: "static_pages#admin"
  devise_scope :user do
    get "login", to: "api/sessions#new"
  end

  namespace :api, defaults: {format: :json} do
    resources :patterns, only: [:create, :show, :update, :destroy, :index]
    resources :pattern_files, only: [:create, :show, :update, :destroy, :index]
    resources :download_codes, only: [:create, :show, :update, :destroy, :index] do
      get 'search', on: :collection
    end
  end
end
