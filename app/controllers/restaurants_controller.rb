class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
        redirect_to @restaurant
    else
      render :edit
    end
  end

  def show
    #ここにはレビューのコントローラーを書くことになりそう
  end

  def destroy
  end

private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :address,
      :phone,
      :URL
      )
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
