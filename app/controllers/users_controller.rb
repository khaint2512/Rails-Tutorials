class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index, edit, update, destroy)
  before_action :correct_user, only: %i(edit, update)
  before_action :admin_user, only: %i(destroy)
  before_action :load_user, only: %i(show, edit, update, destroy)

  def index
    @users = User.page(params[:page]).per Settings.controllers.users.index.per_page
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
      @user.send_activation_email
      flash[:info] = t ".flash.info"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = User.find_by id: params[:id]
    return @user if @user
    render file: "public/404.html", status: :user_not_found
  end

  def update
    if @user.update user_params
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

  def update
    if @user.update user_params
      flash[:success] = t ".flash.success"
      redirect_to @user
    else
      render :edit
    end
  end

  def edit
    @user = User.find_by id: params[:id]
    return @user if @user
    render file: "public/404.html", status: :user_not_found
  end

  def update
    if @user.update user_params
      flash[:success] = t ".flash.success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".flash.success"
    else
      flash[:danger] = t ".flash.danger"
    end
    redirect_to users_url
  end

  def update
    if @user.update user_params
      flash[:success] = t ".flash.success"
      redirect_to @user
    else
      render :edit
    end
  end

  def following
    @title = t ".following"
    @user = User.find_by id: params[:id]
    @users = User.page(params[:page]).per Settings.controllers.users.index.per_page
    render :show_follow
  end

  def followers
    @title = t ".followers"
    @user = User.find_by id: params[:id]
    @users = User.page(params[:page]).per Settings.controllers.users.index.per_page
    render :show_follow
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return @user if @user
    render file: "public/404.html", status: :user_not_found
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".danger"
      redirect_to login_url
    end
  end

  def logged_in_user
    return unless logged_in?
    store_location
    flash[:danger] = t ".danger"
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
