class ApplicationController < ActionController::Base
  protect_from_forgery
  def index
    if user_signed_in?
      @client = Dropbox::API::Client.new(current_user.dropbox_params)
      @links = @client.ls 
    end
    render 
  end  

  def home
    if user_signed_in?
      @client = Dropbox::API::Client.new(current_user.dropbox_params)
      @links = @client.ls params[:path] || ''
      render 'index'
    end
  end

  def file
    if user_signed_in
      @file = @client.search params[:path]
      render 'index'
    end
  end
end
