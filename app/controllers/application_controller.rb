class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user, :authorize

  protected

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def authorize
    unless @user
      redirect_to signin_url, notice: "Please sign in"
    end
  end
end
