require "rails_helper"

RSpec.describe UsersController, :type => :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/signin").to route_to("sessions#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/signout").to route_to("sessions#destroy")
    end

  end
end
