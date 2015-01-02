class StaticPagesController < ApplicationController
  before_action :require_admin, only: [:admin]

  def root
  end

  def admin
  end

  private

  def require_admin
    redirect_to login_url unless current_user && current_user.admin?
  end
end
