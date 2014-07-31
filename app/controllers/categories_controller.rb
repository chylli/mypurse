class CategoriesController < ApplicationController
  before_action :set_type

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /Categories
  # GET /Categories.json
  def index
    @categories = type_class.all
  end

  # GET /Categories/1
  # GET /Categories/1.json
  def show
  end

  # GET /Categories/new
  def new
    @category = type_class.new
  end

  # GET /Categories/1/edit
  def edit
  end

  # POST /Categories
  # POST /Categories.json
  def create
    @category = type_class.new(category_params)
    @category.user = @user

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Categories/1
  # PATCH/PUT /Categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Categories/1
  # DELETE /Categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    #TODO test user_id is filted
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(@type.underscore.to_sym).permit(:name, :description, :parent_id)
    end

    def set_type
      @type = type
    end

    def type
      Category::TYPES.include?(params[:type]) ? params[:type] : "AccountCategory"
    end

    def type_class
      type.constantize
    end

end
