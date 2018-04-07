require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do

  describe "GET #index" do
    before do
      @product   = create(:product, name: 'Notebook')
      @product_2 = create(:product, name: 'Chip')
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns 2 product" do
      get :index
      expect(JSON.parse(response.body).count).to eql(2)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      product = create(:product)
      get :show, params: { id: product.id }
      expect(response).to have_http_status(:success)
    end
  end

end
