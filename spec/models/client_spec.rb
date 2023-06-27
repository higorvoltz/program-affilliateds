# frozen_string_literal: true

require 'rails_helper'
require 'pry-rails'

RSpec.describe Client do
  context 'when saved' do
    let(:client) { create(:client) }

    it 'has a name' do
      expect(client.name).to be_present
    end

    it 'has an email' do
      expect(client.email).to be_present
    end

    it 'has a balance' do
      expect(client.balance).to be_present
    end

    it 'has a password' do
      expect(client.password_digest).to be_present
    end
  end
end
