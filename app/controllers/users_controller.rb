class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return @user if @user
    render file: "public/404.html", status: :user_not_found
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".flash.success"
      redirect_to @user
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :password, :password_confirmation
    end
end
