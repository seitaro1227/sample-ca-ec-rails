class FindProducts
  include Interactor

  def call
    product_ids = context.param_products.map{_1[:id]}
    context.products = Product.find(product_ids)
  rescue
    context.fail!(message: '商品が存在しない')
  end
end
