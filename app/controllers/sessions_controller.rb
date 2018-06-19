class SessionsController < ApplicationController
  def login
    authenticate_user(params[:email], params[:password])
  end
end
