# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe ProductsController, type: :controller do
      before do
        request.headers['X-Api-Key'] = ENV['API_KEY']
      end

      describe 'GET #index' do
        it 'returns status ok with valid params' do
          create_list(:product, 3)
          get :index
          expect(response).to have_http_status(:ok)
        end

        it 'returns all Products' do
          products = create_list(:product, 3)
          get :index
          expect(JSON.parse(response.body)).to match_array(
            products.map { |product| a_hash_including('id' => product.id) }
          )
        end

        it 'returns a not found error status, if no products are found' do
          get :index
          expect(response).to have_http_status(:not_found)
        end
      end

      describe 'GET #show' do
        let(:product) { create(:product) }

        it 'returns status ok with valid params' do
          get :show, params: { id: product.id }
          expect(response).to have_http_status(:ok)
        end
      end

      describe 'POST #create' do
        let(:productor) { create(:productor) }

        it 'creates a new Product' do
          product_params = { product: attributes_for(:product, productor_id: productor.id) }
          post :create, params: product_params
          expect(response).to have_http_status(:created)
        end
      end

      describe 'PUT #update' do
        let(:productor) { create(:productor) }
        let(:product) { create(:product) }

        it 'update the relative field' do
          product_params = {
            product: attributes_for(:product, name: 'New Product')
          }
          put :update, params: product_params.merge(id: product.id)
          product.reload
          expect(product.name).to eq('New Product')
        end

        it 'updates PUT returns status ok' do
          product_params = {
            product: attributes_for(:product, name: 'New Product')
          }
          put :update, params: product_params.merge(id: product.id)
          product.reload
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
