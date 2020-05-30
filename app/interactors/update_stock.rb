# 在庫を更新する
class UpdateStock
  include Interactor

  def call
    product_id_count = context.products.map { |item| [item[:id], item[:count]] }.to_h
    products = Product.where(id: product_id_count.keys).map do |product|
      product.subtraction_stock(product_id_count[product.id])
    end
    context.fail!(message: '在庫の更新に失敗') unless products.map(&:save).all?
  end
end
