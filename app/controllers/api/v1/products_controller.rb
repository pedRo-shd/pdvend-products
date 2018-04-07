class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
    json_response(@products)
  end

  def create
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :height, :weight, :width, :length)
  end
end
