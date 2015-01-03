class Api::UsersController < Devise::RegistrationsController
  respond_to :json
  wrap_parameters :user, include: [:first_name, :last_name, :email, :password, :password_confirmation] 
  before_action :require_admin, only: [:destroy]
end
