require "rails_helper"

RSpec.describe ConfigureController, :type => :routing do
  describe "routing" do

    it "routes to #categories when get property_categories" do
      expect(:get => "/configure/property_categories").to route_to("configure#categories", :category_type => 'PropertyCategory')
    end

    it "routes to #categories when get liability_categories" do
      expect(:get => "/configure/liability_categories").to route_to("configure#categories", :category_type => 'LiabilityCategory')
    end

    it "routes to #categories when get earning_categories" do
      expect(:get => "/configure/earning_categories").to route_to("configure#categories", :category_type => 'EarningCategory')
    end

    it "routes to #categories when get expense_categories" do
      expect(:get => "/configure/expense_categories").to route_to("configure#categories", :category_type => 'ExpenseCategory')
    end

  end
end
