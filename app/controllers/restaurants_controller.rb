class RestaurantsController < ApplicationController
  before_anction :set_restaurant, only: [:edit, :show, :update, :destroy]
  def index
    @restaurants = Restaurant.all.by_new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render "new"
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def show
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path(@restaurant)
    else
      render "edit"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params[:restaurant].permit(:name, :address)
  end



end
