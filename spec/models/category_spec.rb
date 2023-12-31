# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  subject(:category) { create(:category) }

  it { is_expected.to be_valid }
  it { is_expected.to have_many(:transactions) }

  context 'when name is nil' do
    it 'raises an exception' do
      expect { create(:category, name: nil) }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end
end
