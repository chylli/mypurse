class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @new_user = User.new
  end

  # GET /users/1/edit
  def edit
    @new_user = @user
  end

  # POST /users
  # POST /users.json
  def create
    @new_user = User.new(user_params)

    respond_to do |format|
      if @new_user.save
        format.html { redirect_to @new_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @new_user }
      else
        format.html { render :new }
        format.json { render json: @new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @new_user = @user
    success = false
    if @new_user.authenticate(params[:user][:current_password])
      if @new_user.update(user_params)
        success = true
      end
    else
      @new_user.errors.add(:current_password)
    end
      

    respond_to do |format|
      if success
        format.html { redirect_to @new_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @new_user }
      else
        format.html { render :edit }
        format.json { render json: @new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
