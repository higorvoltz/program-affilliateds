# frozen_string_literal: true

require 'rails_helper'
require 'pry-rails'

module Api
  module V1
    RSpec.describe ProductRankingsController, type: :controller do
      before do
        request.headers['X-Api-Key'] = ENV['API_KEY']
      end

      describe 'GET #index' do
        it 'returns status ok with valid params' do
          create_list(:product_ranking, 3)
          get :index
          expect(response).to have_http_status(:ok)
        end

        it 'returns all ProductRankings' do
          product_rankings = create_list(:product_ranking, 3)
          get :index
          expect(JSON.parse(response.body)).to match_array(
            product_rankings.map { |product_ranking| a_hash_including('id' => product_ranking.id) }
          )
        end

        it 'returns a not found error status, if no productRanking are found' do
          get :index
          expect(response).to have_http_status(:not_found)
        end
      end

      describe 'GET #show' do
        let(:product_ranking) { create(:product_ranking) }

        it 'returns status ok with valid params' do
          get :show, params: { id: product_ranking.id }
          expect(response).to have_http_status(:ok)
        end
      end

      describe 'POST #create' do
        let(:product) { create(:product) }
        let(:client) { create(:client) }
        let(:product_ranking) { create(:product_ranking) }

        it 'creates a new productRanking' do
          product_ranking_params = { product_ranking: attributes_for(:product_ranking, product_id: product.id, client_id: client.id) }
          post :create, params: product_ranking_params
          expect(response).to have_http_status(:created)
        end
      end

      describe 'PUT #update' do
        let(:product) { create(:product) }
        let(:client) { create(:client) }
        let(:product_ranking) { create(:product_ranking) }

        it 'update the relative field' do
          product_ranking_params = {
            product_ranking: attributes_for(:product_ranking, product_id: product.id, client_id: client.id, ranking: 4)
          }
          put :update, params: product_ranking_params.merge(id: product_ranking.id)
          product_ranking.reload
          expect(product_ranking.ranking).to eq(4)
        end

        it 'updates PUT returns status ok' do
          product_ranking_params = {
            product_ranking: attributes_for(:product_ranking, product_id: product.id, client_id: client.id, ranking: 4)
          }
          put :update, params: product_ranking_params.merge(id: product_ranking.id)
          product_ranking.reload
          expect(response).to have_http_status(:ok)
        end
      end

      describe 'DELETE #destroy' do
        let(:product_ranking) { create(:product_ranking) }

        it 'deletes the product_ranking with the given id' do
          delete :destroy, params: { id: product_ranking.id }
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
