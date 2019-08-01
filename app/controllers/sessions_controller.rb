class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
    else
      flash[:danger] = t ".flash.danger"
      render :new
    end
  end

  def destroy
  end
end
