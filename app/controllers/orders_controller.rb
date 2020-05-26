class OrdersController < ApplicationController

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:user_id, products: [])
    end
end
