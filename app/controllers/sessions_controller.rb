class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end


  def create
    user = User.find_by(email: params[:email])
    #logger.warn "name: #{params[:name]}"
    #logger.warn "password: #{params[:password]}"
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, alert: "Welcome to mypurse, " + user.name
    else
      redirect_to signin_url, flash: {signin_error: t("Invalid email/password combination")}
    end
  end

  def destroy
    session.delete :user_id
    @user = nil
  end
end
