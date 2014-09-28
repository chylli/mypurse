require 'rails_helper'

RSpec.describe TemplatesController, :type => :controller do
  describe "Get show with path index" do
    it "will render to /views/templates/index without layout" do
      path = "index"
      get :show, {path: path}, {}
      expect(response).to render_template("templates/#{path}")
    end
  end
end
