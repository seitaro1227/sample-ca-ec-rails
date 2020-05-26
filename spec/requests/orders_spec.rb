require 'rails_helper'

RSpec.describe "/orders", type: :request do
  let!(:user) { create(:user) }
  let!(:products) { create_list(:product, 3) }
  let!(:products_id_count) { products.map { |item| [item.id, item.count] }.to_h }
  let(:valid_attributes) {
    {
        user_id: user.id,
        products: products.pluck(:id, :count).map { |id, count| {id: id, count: count} }
    }
  }

  describe "GET /index" do
    before do
      create_list(:order, 3)
    end

    it "renders a successful response" do
      get orders_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let!(:before_order_count) { Order.count }
      before do
        post orders_url, params: {order: valid_attributes}, as: :json
      end
      # * ユーザーid, 商品, 個数を受け取る
      # * 在庫がある時だけ注文を作成する
      # * 注文を確定すると在庫を減らす
      # * 配送先はユーザーごとに持っている
      example "http status codeが正常に" do
        expect(response).to have_http_status(:created)
      end

      example "注文が作られた" do
        expected = before_order_count + 1
        expect(Order.count).to eq expected
      end

      example "商品が減っている" do
        products_ids = products.pluck(:id)
        new_product_count = Product.where(id: products_ids).pluck([:id, :count]).to_h
        new_product_count.each_key { |key|
          expected = products_id_count[key]
          actual = new_product_count[key]
          expect(actual).to be < expected
        }
      end
    end

    context "with invalid parameters" do
      context "在庫がない商品を注文する" do
        let(:invalid_stock_over_products_attributes) {
          valid_attributes.merge(
              {products: products.pluck(:id, :count).map { |id, _count| {id: id, count: 99} }}
          )
        }
        let!(:before_order_count) { Order.count }
        before do
          post orders_url, params: invalid_stock_over_products_attributes, as: :json
        end

        example "http status unprocessable_entity" do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        example "注文が作られていないこと" do
          expected = before_order_count
          expect(Order.count).to eq expected
        end
      end
      context "存在しない商品を注文する" do
        let(:invalid_not_found_products_attributes) {
          valid_attributes.merge(
              {products: products.pluck(:id, :count).map { |_id, count| {id: -1, count: count} }}
          )
        }
        let!(:before_order_count) { Order.count }
        before do
          post orders_url, params: invalid_not_found_products_attributes, as: :json
        end

        example "http status unprocessable_entity" do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        example "注文が作られていないこと" do
          expected = before_order_count
          expect(Order.count).to eq expected
        end
      end

      context "存在しないユーザーが注文する" do
        let(:invalid_not_found_user_attributes) {
          valid_attributes.merge({user_id: -1})
        }
        let!(:before_order_count) { Order.count }
        before do
          post orders_url, params: invalid_not_found_user_attributes, as: :json
        end

        example "http status unprocessable_entity" do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        example "注文が作られていないこと" do
          expected = before_order_count
          expect(Order.count).to eq expected
        end
      end
    end
  end
end
