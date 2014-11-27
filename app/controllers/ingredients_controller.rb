class IngredientsController < ApplicationController
  before_action :authenticate_user!
  around_filter :set_time_zone

  def create
    @ingredient = current_user.ingredients.build(ingredient_params)

    if @ingredient.save
      flash[:success] = "Ingredient added"

      # This should redirect to the page that the ingredient was created on.
      redirect_to current_user
    else
      @user = current_user
      render 'users/show'
    end
  end

  def destroy
    # TODO: ensure ingredient to be deleted belongs to this user!
    @user = User.find(params[:user_id])
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.destroy
      flash[:success] = "Ingredient deleted"
      redirect_to @user
    end
  end

  private

    def ingredient_params
      params.require(:ingredient).permit([:name, :expiration_date_id, :purchase_date])
    end

    def set_time_zone
      old_tz = Time.zone
      Time.zone = current_user.timezone unless current_user.nil?
      yield
    ensure
      Time.zone = old_tz
    end
end
