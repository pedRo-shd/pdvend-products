class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def create
    @product = Product.new(product_params)
    if @product.save
      json_response(@product, :created)
    else
      json_response(@product.errors.messages, :unprocessable_entity)
    end
  end

  def show
    freight = FreightProductJob.perform_now(@product)
    json_response(freight)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:name, :description, :height, :weight, :width, :length)
  end
end
