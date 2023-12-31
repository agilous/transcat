# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/transactions' do
  describe 'GET /index' do
    it 'renders a successful response' do
      get transactions_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let!(:transaction) { create(:transaction) }

    it 'renders a successful response' do
      get transaction_url(transaction)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_transaction_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:transaction) { create(:transaction) }

    it 'renders a successful response' do
      get edit_transaction_url(transaction)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) { attributes_for(:transaction) }

      it 'creates a new Transaction' do
        expect do
          post transactions_url, params: { transaction: valid_attributes }
        end.to change(Transaction, :count).by(1)
      end

      it 'redirects to the created transaction' do
        post transactions_url, params: { transaction: valid_attributes }
        expect(response).to redirect_to(transaction_url(Transaction.last))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { attributes_for(:transaction) }

      before { invalid_attributes[:amount] = nil }

      it 'does not create a new Transaction' do
        expect do
          post transactions_url, params: { transaction: invalid_attributes }
        end.not_to change(Transaction, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post transactions_url, params: { transaction: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:transaction) { create(:transaction) }
      let(:new_attributes) { transaction.attributes.merge(amount: (transaction.amount + 100)) }

      it 'updates the requested transaction' do
        patch transaction_url(transaction), params: { transaction: new_attributes }
        transaction.reload
        expect(transaction.reload.amount).to eq(new_attributes[:amount])
      end

      it 'redirects to the transaction' do
        patch transaction_url(transaction), params: { transaction: new_attributes }
        transaction.reload
        expect(response).to redirect_to(transaction_url(transaction))
      end
    end

    context 'with invalid parameters' do
      let!(:transaction) { create(:transaction) }
      let(:invalid_attributes) { transaction.attributes.merge(amount: nil) }

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch transaction_url(transaction), params: { transaction: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:transaction) { create(:transaction) }

    it 'destroys the requested transaction' do
      expect do
        delete transaction_url(transaction)
      end.to change(Transaction, :count).by(-1)
    end

    it 'redirects to the transactions list' do
      delete transaction_url(transaction)
      expect(response).to redirect_to(transactions_url)
    end
  end
end
