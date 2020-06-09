
# Orderを組み立てる
class BuildOrder
  include Interactor

  def call
    order = Order.new({user: context.user, products: context.products})
    # TODO paramter_objectとか使ってみる(?)
    product_id_count = context.param_products.map { |item| [item[:id], item[:count]] }.to_h
    order.order_product_items.each do |order_product_item|
      count = product_id_count[order_product_item.product.id]
      order_product_item.inventory_allocation(count)
    end

    context.fail!(message: order.errors) unless order.valid?
    context.order = order
  end
end
