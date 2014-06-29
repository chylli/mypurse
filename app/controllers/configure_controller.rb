class ConfigureController < ApplicationController
  def language
  end
  
  def update_language
    @user.language = params[:user][:language]
    respond_to do |format|
      if @user.save
        format.js
      end
    end
  end

end
