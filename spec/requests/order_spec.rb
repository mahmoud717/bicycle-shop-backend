require 'rails_helper'

RSpec.describe 'order API', type: :request do
  let!(:order) { create(:order) }
  let(:order_id) { order.id }

  describe 'GET  orders' do
    before { get '/api/v1/orders' }
    it 'returns order' do
      expect(response).to have_http_status(:success)
      expect do
        JSON.parse(response.body)
      end.to_not raise_error
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET user order' do
    before { get "/api/v1/orders/#{order_id}" }

    context 'when the record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /orders' do
    let(:valid_attributes) do
      { order: { product_name: 'name', product_image_url: 'url' } }
    end

    context 'when the request is valid' do
      before { post '/api/v1/orders', params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/orders', params: { order: { name: 'TestUser2' } } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Product name can't be blank/)
      end
    end
  end
end
