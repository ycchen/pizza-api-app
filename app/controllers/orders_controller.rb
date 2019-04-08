class OrdersController < ApplicationController
  before_action :authorize_request
  before_action :set_order, except: %i[create index]

  def index
    @orders = @current_user.orders
    render json: @orders, status: :ok
  end

  def show
    render json: @order, status: :ok
  end

  def create
    @order = @current_user.orders.build
    @order.build_pizza_order_with_pizza_ids_and_quantities(params[:order][:pizza_ids_and_quantities])
    
    if @order.save
      render json: @order, status: 201
    else
      render json: { errors: @order.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = @current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :pizza_ids_and_quantities => [])
  end
end
