# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe ClientsController, type: :controller do
      before do
        request.headers['X-Api-Key'] = ENV['API_KEY']
      end

      describe 'GET #index' do
        it 'returns status ok with valid params' do
          create_list(:client, 3)
          get :index
          expect(response).to have_http_status(:ok)
        end

        it 'returns all Clients' do
          clients = create_list(:client, 3)
          get :index
          expect(JSON.parse(response.body)).to match_array(
            clients.map { |client| a_hash_including('id' => client.id) }
          )
        end

        it 'returns a not found error status, if no clients are found' do
          get :index
          expect(response).to have_http_status(:not_found)
        end
      end

      describe 'GET #show' do
        let(:client) { create(:client) }

        it 'returns status ok with valid params' do
          get :show, params: { id: client.id }
          expect(response).to have_http_status(:ok)
        end

        it 'returns the client the correct params when it is given the id' do
          get :show, params: { id: client.id }
          expect(JSON.parse(response.body)).to eq(
            'id' => client.id,
            'name' => client.name,
            'email' => client.email,
            'balance' => client.balance
          )
        end
      end

      describe 'POST #create' do
        it 'creates a new Client' do
          client_params = { client: attributes_for(:client) }
          post :create, params: client_params
          expect(response).to have_http_status(:created)
        end
      end

      describe 'DELETE #destroy' do
        let(:client) { create(:client) }

        it 'deletes the client with the given id' do
          delete :destroy, params: { id: client.id }
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
