Rails.application.routes.draw do
  # devise_for :users
  root "static_pages#root"

  namespace :api, defaults: {format: :json} do
    resources :patterns, only: [:create, :show, :update, :destroy, :index]
    resources :pattern_files, only: [:create, :show, :update, :destroy, :index]
  end
end
