class IngredientsController < ApplicationController
  before_action :authenticate_user!
  around_filter :set_time_zone

  def create
    @ingredient = current_user.ingredients.build(ingredient_params)

    if @ingredient.save
      flash[:success] = "Ingredient added!"
      redirect_to user_path(current_user)
    else
      @user = current_user
      render 'users/show'
    end
  end

  def destroy
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
