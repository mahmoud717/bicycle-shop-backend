require 'rails_helper'

RSpec.describe 'bicycle API', type: :request do
  let!(:bicycle) { create(:bicycle) }
  let(:bicycle_id) { bicycle.id }

  describe 'GET /bicycles' do
    before { get '/api/v1/bicycles' }
    it 'returns user' do
      expect(response).to have_http_status(:success)
      expect do
        JSON.parse(response.body)
      end.to_not raise_error
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /bicycles/:id' do
    before { get "/api/v1/bicycles/#{bicycle_id}" }

    context 'when the record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /bicycles' do
    let(:valid_attributes) do
      { bicycle: { name: 'name', model: 'model', image_url: 'url', description: 'desc' } }
    end

    context 'when the request is valid' do
      before { post '/api/v1/bicycles', params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/bicycles', params: { bicycle: { name: 'TestUser2' } } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Model can't be blank/)
      end
    end
  end
end
