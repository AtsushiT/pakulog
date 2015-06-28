class ReviewsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      body: review_params["body"],
      score: review_params["score"]
    )
    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
        redirect_to @restaurant
    else
      render :edit
    end
  end



private

  def review_params
    params.require(:review).permit(
      :body,
      :score
      )
  end
end
