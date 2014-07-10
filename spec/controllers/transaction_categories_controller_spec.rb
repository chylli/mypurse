require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TransactionCategoriesController, :type => :controller do

  let(:user) {
    User.create!(:name => 'name', :email => 'email@example.com', :password => 'password', :password_confirmation => 'password')
  }
  # This should return the minimal set of attributes required to create a valid
  # TransactionCategory. As you add validations to TransactionCategory, be sure to
  # adjust the attributes here as well.
  # It is used to create an Category directly
  let(:valid_attributes) {
    {user_id: user.id, :name => 'name'}
  }

  # This is used to post to create an Category
  let(:valid_attributes2) {
    {name: "type", description: "account type"}
  }

  let(:invalid_attributes) {
    {:name => "x" * 35}
  }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TransactionCategoriesController. Be sure to keep this updated too.
  let(:valid_session) { {user_id: user.to_param} }

  describe "GET index" do
    it "assigns all transaction_categories as @transaction_categories" do
      transaction_category = TransactionCategory.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:transaction_categories)).to eq([transaction_category])
    end
  end

  describe "GET show" do
    it "assigns the requested transaction_category as @transaction_category" do
      transaction_category = TransactionCategory.create! valid_attributes
      get :show, {:id => transaction_category.to_param}, valid_session
      expect(assigns(:transaction_category)).to eq(transaction_category)
    end
  end

  describe "GET new" do
    it "assigns a new transaction_category as @transaction_category" do
      get :new, {}, valid_session
      expect(assigns(:transaction_category)).to be_a_new(TransactionCategory)
    end
  end

  describe "GET edit" do
    it "assigns the requested transaction_category as @transaction_category" do
      transaction_category = TransactionCategory.create! valid_attributes
      get :edit, {:id => transaction_category.to_param}, valid_session
      expect(assigns(:transaction_category)).to eq(transaction_category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TransactionCategory" do
        expect {
          post :create, {:transaction_category => valid_attributes}, valid_session
        }.to change(TransactionCategory, :count).by(1)
      end

      it "assigns a newly created transaction_category as @transaction_category" do
        post :create, {:transaction_category => valid_attributes}, valid_session
        expect(assigns(:transaction_category)).to be_a(TransactionCategory)
        expect(assigns(:transaction_category)).to be_persisted
      end

      it "redirects to the created transaction_category" do
        post :create, {:transaction_category => valid_attributes}, valid_session
        expect(response).to redirect_to(TransactionCategory.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved transaction_category as @transaction_category" do
        post :create, {:transaction_category => invalid_attributes}, valid_session
        expect(assigns(:transaction_category)).to be_a_new(TransactionCategory)
      end

      it "re-renders the 'new' template" do
        post :create, {:transaction_category => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        ({name: "name2"})
      }

      it "updates the requested transaction_category" do
        transaction_category = TransactionCategory.create! valid_attributes
        put :update, {:id => transaction_category.to_param, :transaction_category => new_attributes}, valid_session
        transaction_category.reload
        expect(transaction_category.name).to eq("name2")
      end

      it "assigns the requested transaction_category as @transaction_category" do
        transaction_category = TransactionCategory.create! valid_attributes
        put :update, {:id => transaction_category.to_param, :transaction_category => valid_attributes}, valid_session
        expect(assigns(:transaction_category)).to eq(transaction_category)
      end

      it "redirects to the transaction_category" do
        transaction_category = TransactionCategory.create! valid_attributes
        put :update, {:id => transaction_category.to_param, :transaction_category => valid_attributes}, valid_session
        expect(response).to redirect_to(transaction_category)
      end
    end

    describe "with invalid params" do
      it "assigns the transaction_category as @transaction_category" do
        transaction_category = TransactionCategory.create! valid_attributes
        put :update, {:id => transaction_category.to_param, :transaction_category => invalid_attributes}, valid_session
        expect(assigns(:transaction_category)).to eq(transaction_category)
      end

      it "re-renders the 'edit' template" do
        transaction_category = TransactionCategory.create! valid_attributes
        put :update, {:id => transaction_category.to_param, :transaction_category => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested transaction_category" do
      transaction_category = TransactionCategory.create! valid_attributes
      expect {
        delete :destroy, {:id => transaction_category.to_param}, valid_session
      }.to change(TransactionCategory, :count).by(-1)
    end

    it "redirects to the transaction_categories list" do
      transaction_category = TransactionCategory.create! valid_attributes
      delete :destroy, {:id => transaction_category.to_param}, valid_session
      expect(response).to redirect_to(transaction_categories_url)
    end
  end

end
