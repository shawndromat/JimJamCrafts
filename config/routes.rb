Rails.application.routes.draw do
  root "static_pages#root"

  namespace :api, defaults: {format: :json} do
    resources :patterns, only: [:create, :show, :update, :destroy, :index]
  end
end
