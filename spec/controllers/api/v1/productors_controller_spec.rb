# frozen_string_literal: true

require 'rails_helper'
require 'pry-rails'

module Api
  module V1
    RSpec.describe ProductorsController, type: :controller do
      before do
        request.headers['X-Api-Key'] = ENV['API_KEY']
      end

      describe 'GET #index' do
        it 'returns status ok with valid params' do
          create_list(:productor, 3)
          get :index
          expect(response).to have_http_status(:ok)
        end

        it 'returns all Productors' do
          productors = create_list(:productor, 3)
          get :index
          expect(JSON.parse(response.body)).to match_array(
            productors.map { |productor| a_hash_including('id' => productor.id) }
          )
        end

        it 'returns a not found error status, if no productors are found' do
          get :index
          expect(response).to have_http_status(:not_found)
        end
      end

      describe 'GET #show' do
        let(:productor) { create(:productor) }

        it 'returns status ok with valid params' do
          get :show, params: { id: productor.id }
          expect(response).to have_http_status(:ok)
        end
      end

      describe 'POST #create' do
        it 'creates a new Productor' do
          productor_params = { productor: attributes_for(:productor) }
          post :create, params: productor_params
          expect(response).to have_http_status(:created)
        end
      end

      describe 'PUT #update' do
        let(:productor) { create(:productor) }

        it 'update the relative field' do
          productor_params = {
            productor: attributes_for(:productor, name: 'New Name')
          }
          put :update, params: productor_params.merge(id: productor.id)
          productor.reload
          expect(productor.name).to eq('New Name')
        end

        it 'updates PUT returns status ok' do
          productor_params = {
            productor: attributes_for(:productor, name: 'New Name')
          }
          put :update, params: productor_params.merge(id: productor.id)
          productor.reload
          expect(response).to have_http_status(:ok)
        end
      end

      describe 'DELETE #destroy' do
        let(:productor) { create(:productor) }

        it 'deletes the affiliated with the given id' do
          delete :destroy, params: { id: productor.id }
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
