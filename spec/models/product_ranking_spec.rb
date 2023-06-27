# frozen_string_literal: true

require 'rails_helper'
require 'pry-rails'

RSpec.describe ProductRanking do
  context 'when saved' do
    let(:product_ranking) { create(:product_ranking) }

    it 'has a ranking' do
      expect(product_ranking.ranking).to be_present
    end

    it 'has a client_id' do
      expect(product_ranking.client_id).to be_present
    end

    it 'has a product_id' do
      expect(product_ranking.product_id).to be_present
    end
  end
end
