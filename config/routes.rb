Rails.application.routes.draw do
  devise_for :users, path: 'api/users', controllers: {
    registrations: "api/users",
    sessions: "api/sessions"}
  root "static_pages#root"

  namespace :api, defaults: {format: :json} do
    resources :patterns, only: [:create, :show, :update, :destroy, :index]
    resources :pattern_files, only: [:create, :show, :update, :destroy, :index]
  end
end
