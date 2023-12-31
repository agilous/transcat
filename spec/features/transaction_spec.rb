# frozen_string_literal: true

require 'rails_helper'

describe 'Transaction' do
  describe 'creating' do
    before do
      visit new_transaction_path

      fill_in 'Amount', with: '1000'
      fill_in 'Date', with: '2005-02-13'
      fill_in 'Description', with: 'Shell'

      click_button 'Create Transaction'
    end

    it 'displays a success message' do
      expect(page).to have_text 'Transaction was successfully created.'
    end

    it 'displays the new Transaction' do
      expect(page).to have_text "Date: 2005-02-13\nAmount: 1000\nDescription: Shell"
    end
  end

  describe 'deleting' do
    let(:transaction) { create(:transaction) }

    before do
      visit transaction_path(transaction)

      click_button 'Destroy this transaction'
    end

    it 'displays a success message' do
      expect(page).to have_text 'Transaction was successfully destroyed.'
    end

    it 'returns to the index view' do
      expect(page).to have_current_path(transactions_path)
    end
  end

  describe 'indexing' do
    let!(:transactions) { create_list(:transaction, 3) }

    before do
      visit transactions_path
    end

    it 'lists all the transaction names' do
      expect(transactions).to(be_all do |t|
                                !page.text(/Date: #{t.date}\nAmount: #{t.amount}Description: #{t.description}/).nil?
                              end)
    end
  end

  describe 'showing' do
    let(:transaction) { create(:transaction) }

    before do
      visit transaction_path(transaction)
    end

    it 'displays the transaction amount' do
      expect(page).to have_text "Amount: #{transaction.amount}"
    end

    it 'displays the transaction date' do
      expect(page).to have_text "Date: #{transaction.date}"
    end

    it 'displays the transaction description' do
      expect(page).to have_text "Description: #{transaction.description}"
    end
  end

  describe 'updating' do
    let(:transaction) { create(:transaction) }
    let(:new_amount) { transaction.amount + 100 }

    before do
      visit edit_transaction_path(transaction)

      fill_in 'Amount', with: new_amount
      click_button 'Update Transaction'
    end

    it 'displays a success message' do
      expect(page).to have_text 'Transaction was successfully updated.'
    end

    it 'displays the updated Transaction' do
      expect(page).to have_text "Amount: #{new_amount}"
    end
  end
end
