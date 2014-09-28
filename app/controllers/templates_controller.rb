class TemplatesController < ApplicationController
  skip_before_action :authorize
  def show
    path = params[:path] || "index"
    #render file: "templates/#{path}", handler: [:haml], layout: false
    render "templates/#{path}", layout: false
    #render "/tmp/test.html.haml",layout:false
  end
end
