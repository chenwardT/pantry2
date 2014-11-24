class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @ingredients = @user.ingredients
    unless @user == current_user
      redirect_to :back, alert: 'Access denied.'
    end
  end
end
