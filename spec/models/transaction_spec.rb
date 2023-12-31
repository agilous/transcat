# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction do
  subject(:transaction) { create(:transaction) }

  it { is_expected.to be_valid }
  it { is_expected.to belong_to(:category).optional }

  %w[amount date description].each do |attribute|
    context "when #{attribute} is nil" do
      let(:attrs) { attributes_for(:transaction) }

      before { attrs[attribute.to_sym] = nil }

      it 'raises an exception' do
        expect { create(:transaction, attrs) }.to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end
end
