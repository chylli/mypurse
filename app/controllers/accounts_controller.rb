class AccountsController < ApplicationController
  before_action :set_type

  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = type_class.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = type_class.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = type_class.new(account_params)
    @account.user = @user

    respond_to do |format|
      if @account.save
        #format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.html { redirect_to configure_accounts_path, notice: 'Account was successfully created.'}
        format.json { render :show, status: :created, location: @account }
      else
        #format.html { render :new }
        format.html { redirect_to configure_accounts_path, notice: 'Error Happened.'}
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # TODO test user_id is not permit
    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :description, :category_id, :balance, :type, :init_balance, :currency_id)
    end



    def set_type
      @type = type
    end

    def type
      Account::TYPES.include?(params[:type]) ? params[:type] : "Account"
    end

    def type_class
      type.constantize
    end

    # TODO test account sti views  carefully

end
