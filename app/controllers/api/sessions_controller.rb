class Api::SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication
  before_action :already_logged_in, only: [:create]
  respond_to :json

  def create
    resource = User.find_for_database_authentication(email: params[:session][:email])
    return invalid_login_attempt unless resource
 
    if resource.valid_password?(params[:session][:password])
      sign_in("user", resource)
      render json: resource
    else
      invalid_login_attempt
    end
  end

  private
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

  def already_logged_in
    if current_user
      render json: {success: false, message: "Already logged in"}, status: 401
    end
  end
end
