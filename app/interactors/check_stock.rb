# 在庫をチェック
class CheckStock
  include Interactor

  def call
    # TODO: paramsObjectを使う
    product_id_count = context.param_products.map { |item| [item[:id], item[:count]] }.to_h
    valid_stock = context.products.map { |product|
      product.count >= product_id_count[product.id]
    }.all?

    context.fail!(message: '在庫がない') unless valid_stock
  end
end
