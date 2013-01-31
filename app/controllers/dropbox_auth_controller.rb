class DropboxAuthController < ApplicationController
  def authorize
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = consumer.get_request_token
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url(:oauth_callback => 'http://localhost:3000/authed')
  end

  def authorize_callback
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = OAuth::RequestToken.new(consumer, session[:request_token], session[:request_token_secret])
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_token])

    current_user.dropbox_access_key = access_token.token
    current_user.dropbox_access_secret = access_token.secret
    current_user.save
    redirect_to '/'
  end
end