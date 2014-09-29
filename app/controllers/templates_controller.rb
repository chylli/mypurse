class TemplatesController < ApplicationController
  skip_before_action :authorize
  def show
    path = params[:path]
    #render file: "templates/#{path}", handler: [:haml], layout: false
    if path
      render "templates/#{path}"
    else
      render "templates/index", layout: false
    end
    #render "/tmp/test.html.haml",layout:false
  end
end
