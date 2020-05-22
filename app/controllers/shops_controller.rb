class ShopsController < ApplicationController
  def show
    @shop = Shop.first
    render json: @shop
  end
end
