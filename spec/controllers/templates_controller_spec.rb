require 'rails_helper'

RSpec.describe TemplatesController, :type => :controller do
  describe "Get show with path testpath/test" do
    it "will render to /views/templates/testpath/test without layout" do
      path = "testpath/test"
      get :show, {path: path}, {}
      expect(response).to render_template("templates/#{path}")
    end
  end
end
