# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Productor do
  context 'when saved' do
    let(:productor) { create(:productor) }

    it 'has a name' do
      expect(productor.name).to be_present
    end

    it 'has an email' do
      expect(productor.email).to be_present
    end

    it 'has a balance' do
      expect(productor.balance).to be_present
    end

    it 'has a password' do
      expect(productor.password_digest).to be_present
    end
  end
end