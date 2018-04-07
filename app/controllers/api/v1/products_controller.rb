class Api::V1::ProductsController < ApplicationController

  before_action :set_product, only: %i[show]

  def index
  end

  def create
  end

  def show
  end

  private

  def method
    @product = Product.find(params[:id])
  end
end
