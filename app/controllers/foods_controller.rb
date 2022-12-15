class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      flash[:notice] = 'Food was successfully created'
      redirect_to foods_path
    else
      flash[:alert] = 'Food was not created'
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
