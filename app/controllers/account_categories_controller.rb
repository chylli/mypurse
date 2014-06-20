class AccountCategoriesController < ApplicationController
  before_action :set_account_category, only: [:show, :edit, :update, :destroy]

  # GET /account_categories
  # GET /account_categories.json
  def index
    @account_categories = AccountCategory.all
  end

  # GET /account_categories/1
  # GET /account_categories/1.json
  def show
  end

  # GET /account_categories/new
  def new
    @account_category = AccountCategory.new
  end

  # GET /account_categories/1/edit
  def edit
  end

  # POST /account_categories
  # POST /account_categories.json
  def create
    @account_category = AccountCategory.new(account_category_params)
    @account_category.user = @user

    respond_to do |format|
      if @account_category.save
        format.html { redirect_to @account_category, notice: 'Account category was successfully created.' }
        format.json { render :show, status: :created, location: @account_category }
      else
        format.html { render :new }
        format.json { render json: @account_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_categories/1
  # PATCH/PUT /account_categories/1.json
  def update
    respond_to do |format|
      if @account_category.update(account_category_params)
        format.html { redirect_to @account_category, notice: 'Account category was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_category }
      else
        format.html { render :edit }
        format.json { render json: @account_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_categories/1
  # DELETE /account_categories/1.json
  def destroy
    @account_category.destroy
    respond_to do |format|
      format.html { redirect_to account_categories_url, notice: 'Account category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_category
      @account_category = AccountCategory.find(params[:id])
    end

    #TODO test user_id is filted
    # Never trust parameters from the scary internet, only allow the white list through.
    def account_category_params
      params.require(:account_category).permit(:name, :description, :parent_id)
    end
end
