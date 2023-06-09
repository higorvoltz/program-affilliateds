# frozen_string_literal: true

RSpec.describe Api::V1::AffiliatedsController, type: :controller do
  describe 'GET #index' do
    it 'returns all Affiliateds' do
      affiliateds = create_list(:affiliated, 3)
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to match_array(
        affiliateds.map { |affiliated| a_hash_including('id' => affiliated.id) }
      )
    end

    it 'returns a not found error if no affiliateds are found' do
      get :index
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to eq({ error: 'Affiliateds not found' })
    end
  end

  describe 'POST #create' do
    it 'creates a new Affiliated' do
      affiliated_params = attributes_for(:affiliated)
      post :create, params: affiliated_params
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq('error' => 'Unprocessable affiliated')
    end

    it 'returns an unprocessable entity error if params are invalid' do
      post :create, params: { name: nil }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq('error' => 'Unprocessable affiliated')
    end
  end

  describe 'PUT #update' do
    let(:affiliated) { create(:affiliated) }

    it 'updates the affiliated with the given id' do
      put :update, params: { id: affiliated.id, name: 'New name' }
      affiliated.reload
      expect(response).to have_http_status(:ok)
      expect(affiliated.name).to eq('New name')
    end

    it 'returns a not found error if no affiliated is found with the given name' do
      put :update, params: { id: 'invalid', name: 'New name' }
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to eq('error' => 'Affiliated not found')
    end
  end

  describe 'DELETE #destroy' do
    let!(:affiliated) { create(:affiliated) }

    it 'deletes the affiliated with the given id' do
      delete :destroy, params: { id: affiliated.id }
      expect(response).to have_http_status(:ok)
      expect(Affiliated.find_by(id: affiliated.id)).to be_nil
    end

    it 'returns a not found error if no affiliated is found with the given id' do
      delete :destroy, params: { id: 'invalid' }
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to eq('error' => 'Affiliated not found')
    end
  end
end
