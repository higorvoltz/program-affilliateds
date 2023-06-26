# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Affiliated do
  context 'when saved' do
    let(:affiliated) { create(:affiliated) }

    it 'has a name' do
      expect(affiliated.name).to be_present
    end

    it 'has an email' do
      expect(affiliated.email).to be_present
    end

    it 'has a balance' do
      expect(affiliated.balance).to be_present
    end

    it 'has a password' do
      expect(affiliated.password_digest).to be_present
    end
  end
end