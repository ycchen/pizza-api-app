class ToppingsController < ApplicationController
  # before_action :authorize_request
  before_action :set_topping, only: [:show, :update, :destroy]

  def index
    @toppings = Topping.all
    render json: @toppings, status: :ok
  end

  def show
    render json: @topping, status: :ok
  end

  def create
    @topping = topping.new(topping_params)
    if @topping.save
      render json: @topping, status: :created
    else
      render json: { errors: @topping.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  def update
    if @topping.update(topping_params)
      render json: @topping, status: :ok
    else
      render json: @topping.errors,status: :unprocessable_entity
    end
  end

  def destroy
    @topping.destroy
  end

  private

  def set_topping
    @topping = Topping.find(params[:id])
  end

  def topping_params
    params.permit(
      :name
    )
  end
end
