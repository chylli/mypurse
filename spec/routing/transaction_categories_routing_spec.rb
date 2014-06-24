require "rails_helper"

RSpec.describe TransactionCategoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/transaction_categories").to route_to("transaction_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/transaction_categories/new").to route_to("transaction_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/transaction_categories/1").to route_to("transaction_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/transaction_categories/1/edit").to route_to("transaction_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/transaction_categories").to route_to("transaction_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/transaction_categories/1").to route_to("transaction_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/transaction_categories/1").to route_to("transaction_categories#destroy", :id => "1")
    end

  end
end
