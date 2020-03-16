class UsersController < ApplicationController
  before_anction :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all.by_new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to users_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


  private
  def set_user
    @user = User.find(params[:id])

  def user_params
    params[:user].permit(:first_name, :last_name, :email, :telephone)
  end

end
