class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # raise
    @restaurant = Restaurant.new(strong_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def strong_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
