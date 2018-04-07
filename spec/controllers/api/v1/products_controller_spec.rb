require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do

  describe "GET #create" do
    # valid payload
    let(:valid_attributes) { { name: 'IBM PC',
                               height: rand(0..1000).to_f,
                               weight: rand(0..1000).to_f,
                               width: rand(0..1000).to_f,
                               length: rand(0..1000).to_f } }

    context 'when the request is valid' do
      it 'returns status code 201' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(201)
      end

      it 'creates a product' do
        post :create, params: valid_attributes
        expect(JSON.parse(response.body)['name']).to eq('IBM PC')
      end
    end
  end

  describe "GET #show" do
    context 'when the record exists' do
      before do
        @product = create(:product)
      end

      it "returns http success" do
        get :show, params: { id: @product.id }
        expect(response).to have_http_status(:success)
      end
    end

    # TODO:
    # context 'when the record does not exist' do
    #   it 'returns status code 404' do
    #     get :show, params: { id: '' }
    #     expect(response).to have_http_status(404)
    #   end
    # end

    context 'fetches the product and returns the freight calculation' do
      before do
        @product   = create(:product, name: 'Spacecraft')
        @product_2 = create(:product)
        @product_3 = create(:product)
      end

      it "returns product" do
        get :show, params: { id: @product.id }
        expect(JSON.parse(response.body)['name']).to eq('Spacecraft')
      end
    end
  end

end
