class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.active
      log_in user
      flash[:success] = t ".edit.flash.success"
      redirect_to user
    else
      flash[:danger] = t ".edit.flash.danger"
      redirect_to root_url
    end
  end
end
