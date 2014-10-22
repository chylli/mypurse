class SessionsController < ApplicationController
  skip_before_action :authorize

  def create
    user = User.find_by(email: params[:email])
    #logger.warn "name: #{params[:name]}"
    #logger.warn "password: #{params[:password]}"
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {name: user.name}, status: :ok
    else
      #render json: {signin_error: t("Invalid email/password combination")}
      render json: {signin_error: t("Invalid email/password combination")}, status: :not_acceptable
    #  redirect_to signin_url, flash: {signin_error: t("Invalid email/password combination")}
    end
  end

  def destroy
    session.delete :user_id
    @logouted_user = @user
    @user = nil
    render json: {}
  end
end
