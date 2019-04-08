# frozen_string_literal: true

class PizzasController < ApplicationController
  before_action :authorize_request
  before_action :set_pizza, only: %i[show update destroy]

  def index
    @pizzas = Pizza.all
    render json: @pizzas, status: :ok
  end

  def show
    render json: @pizza, status: :ok
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      render json: @pizza, status: :created
    else
      render json: { errors: @pizza.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @pizza.update(pizza_params)
      render json: @pizza, status: :ok
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pizza.destroy
  end

  private

  def set_pizza
    @pizza = Pizza.find(params[:id])
  end

  def pizza_params
    params.permit(
      :name, :price
    )
  end
end
