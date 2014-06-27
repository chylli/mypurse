class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :before_auth_set_locale, :set_user, :authorize, :after_auth_set_locale, :set_layout

  protected

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def authorize
    unless @user
      redirect_to signin_url, notice: "Please sign in"
    end
  end

  private
    # TODO test http accept language header
    def before_auth_set_locale
      I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    end

    def after_auth_set_locale
      if @user && @user.language && I18n.available_locales.include?(@user.language.to_sym)
      then
        I18n.locale = @user.language.to_sym
      end
    end


    def set_layout
      controllers_without_left_column = %w(users sessions)
      @has_left_column = true
      if controllers_without_left_column.include?(controller_name)
        @has_left_column = false
      end
    end
end
