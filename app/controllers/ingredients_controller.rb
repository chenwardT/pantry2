class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def create
    @ingredient = current_user.ingredients.build(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient added!"
      redirect_to user_path(current_user)
    else
      render root_path
    end
  end

  def destroy
  end

  private

    def ingredient_params
      params.require(:ingredient).permit([:name, :expiration_date_id, :purchase_date])
    end
end
