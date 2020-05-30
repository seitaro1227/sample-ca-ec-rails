# 在庫をチェック
class CheckStock
  include Interactor

  def call
    product_id_count = context.products.map { |item| [item[:id], item[:count]] }.to_h
    valid_stock = Product.where(id: product_id_count.keys).map { |product|
      product.count >= product_id_count[product.id]
    }.all?

    context.fail!(message: '在庫がない') unless valid_stock
  end
end
