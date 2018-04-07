class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  def show
    json_response(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:name, :description, :height, :weight, :width, :length)
  end
end
