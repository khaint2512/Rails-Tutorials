class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate page: params[:page]
=======
  before_action :logged_in_user, only: %i(:index, :edit, :update, :destroy)
  before_action :correct_user, only: %i(:edit, :update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginates_per page: params[:page]
>>>>>>> Start chapter 10
  end

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

  def edit
    @user = User.find_by id: params[:id]
<<<<<<< HEAD
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes(user_params)
=======
    return @user if @user
    render file: "public/404.html", status: :user_not_found
  end

  def update
    if @user.update user_params
>>>>>>> Start chapter 10
      flash[:success] = t ".flash.success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
<<<<<<< HEAD
    User.find_by id: (params[:id]).destroy
    flash[:success] = t ".flash.success"
=======
    if @user.destroy
      flash[:success] = t ".flash.success"
    else
      flash[:danger] = t ".flash.danger"
    end
>>>>>>> Start chapter 10
    redirect_to users_url
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes(user_params)
      flash[:success] = t ".flash.success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find_by id: (params[:id]).destroy
    flash[:success] = t ".flash.success"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :password, :password_confirmation
    end

    def logged_in_user
<<<<<<< HEAD
      unless logged_in?
        store_location
        flash[:danger] = t ".danger"
        redirect_to login_url
      end
=======
      return unless logged_in?
      store_location
      flash[:danger] = t ".danger"
      redirect_to login_url
>>>>>>> Start chapter 10
    end

    def correct_user
      @user = User.find_by id: params[:id]
      redirect_to root_url unless current_user? @user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
