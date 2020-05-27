class OrdersController < ApplicationController

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # POST /orders
  def create
    @order = Order.new
    # ありえないけどここにビジネスロジックを書いてみる
    #
    product_ids = order_params[:products]&.map { |product| product[:id] }
    product_id_counts = order_params[:products]&.map { |product| [product[:id], product[:count]] }.to_h
    products = Product.where(id: product_ids)

    if products
      # 在庫を更新
      products = products.map do |product|
        product.count = product.count - product_id_counts[product.id]
        product
      end

      @order.order_product_items = products.map do |product|
        order_product_item = OrderProductItem.new
        order_product_item.product = product
        order_product_item.product_name = product.name
        order_product_item.count =  product_id_counts[product.id]
        order_product_item
      end
    end
    # binding.pry

    user = User.find_by(id: order_params[:user_id])
    if user
      @order.user = user
      @order.user_name = user.name
      @order.user_address = "#{user.address_1} #{user.address_2} #{user.address_3}"
    end

    # binding.pry
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:user_id, products: [:id,:count])
    end
end
