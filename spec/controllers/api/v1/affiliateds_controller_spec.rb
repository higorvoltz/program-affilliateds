# frozen_string_literal: true

require 'rails_helper'
require 'pry-rails'

module Api
  module V1
    RSpec.describe AffiliatedsController, type: :controller do
      before do
        request.headers['X-Api-Key'] = ENV['API_KEY']
      end

      describe 'GET #index' do
        it 'returns status ok with valid params' do
          create_list(:affiliated, 3)
          get :index
          expect(response).to have_http_status(:ok)
        end

        it 'returns all Affiliateds' do
          affiliateds = create_list(:affiliated, 3)
          get :index
          expect(JSON.parse(response.body)).to match_array(
            affiliateds.map { |affiliated| a_hash_including('id' => affiliated.id) }
          )
        end

        it 'returns a not found error status, if no affiliateds are found' do
          get :index
          expect(response).to have_http_status(:not_found)
        end
      end

      describe 'GET #show' do
        let(:affiliated) { create(:affiliated) }

        it 'returns status ok with valid params' do
          get :show, params: { id: affiliated.id }
          expect(response).to have_http_status(:ok)
        end

        it 'returns the affiliated the correct params when it is given the id' do
          get :show, params: { id: affiliated.id }
          expect(JSON.parse(response.body)).to eq(
            'id' => affiliated.id,
            'name' => affiliated.name,
            'email' => affiliated.email,
            'balance' => affiliated.balance,
            'productor_id' => affiliated.productor_id,
            'is_active' => affiliated.is_active
          )
        end
      end

      describe 'POST #create' do
        let(:productor) { create(:productor) }

        it 'creates a new Affiliated' do
          affiliated_params = { affiliated: attributes_for(:affiliated, productor_id: productor.id) }
          post :create, params: affiliated_params
          expect(response).to have_http_status(:created)
        end
      end

      describe 'PUT #update' do
        let(:affiliated) { create(:affiliated) }
        let(:productor) { create(:productor) }

        it 'update the relative field' do
          affiliated_params = {
            affiliated: attributes_for(:affiliated, productor_id: productor.id, name: 'New Name')
          }
          put :update, params: affiliated_params.merge(id: affiliated.id)
          affiliated.reload
          expect(affiliated.name).to eq('New Name')
        end

        it 'updates PUT returns status ok' do
          affiliated_params = {
            affiliated: attributes_for(:affiliated, productor_id: productor.id, name: 'New Name')
          }
          put :update, params: affiliated_params.merge(id: affiliated.id)
          affiliated.reload
          expect(response).to have_http_status(:ok)
        end
      end

      describe 'DELETE #destroy' do
        let(:affiliated) { create(:affiliated) }

        it 'deletes the affiliated with the given id' do
          delete :destroy, params: { id: affiliated.id }
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
