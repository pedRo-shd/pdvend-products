require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      puts 'index'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      puts 'create'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      product = create(:product)
      get :show, id: product.id
      puts 'show'
      expect(response).to have_http_status(:success)
    end
  end

end
