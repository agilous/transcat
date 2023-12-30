# frozen_string_literal: true

require 'rails_helper'

describe 'Category' do
  describe 'creating' do
    before do
      visit new_category_path

      fill_in 'Name', with: 'Gas'
      click_button 'Create Category'
    end

    it 'displays a success message' do
      expect(page).to have_text 'Category was successfully created.'
    end

    it 'displays the new Category' do
      expect(page).to have_text 'Name: Gas'
    end

    context 'when attempting to create a duplicate category' do
      before do
        visit new_category_path

        fill_in 'Name', with: Category.last.name
        click_button 'Create Category'
      end

      it 'displays an error message' do
        expect(page).to have_text 'Name has already been taken'
      end

      it 'returns to the new view' do
        expect(page).to have_current_path(new_category_path)
      end
    end
  end

  describe 'deleting' do
    let(:category) { create(:category) }

    before do
      visit category_path(category)

      click_button 'Destroy this category'
    end

    it 'displays a success message' do
      expect(page).to have_text 'Category was successfully destroyed.'
    end

    it 'returns to the index view' do
      expect(page).to have_current_path(categories_path)
    end
  end

  describe 'indexing' do
    let(:category_names) { %w[Food Gas Utilities Rent] }
    let!(:categories) { category_names.map { |name| create(:category, name:) } }

    before do
      visit categories_path
    end

    it 'lists all the category names' do
      expect(categories.pluck(&:name)).to(be_all { |name| !page.text(/Name: #{name}/).nil? })
    end
  end

  describe 'showing' do
    let(:category) { create(:category) }

    before do
      visit category_path(category)
    end

    it 'displays the category name' do
      expect(page).to have_text "Name: #{category.name}"
    end
  end

  describe 'updating' do
    let(:category) { create(:category) }
    let(:new_name) { "#{category.name} and more!" }

    before do
      visit edit_category_path(category)

      fill_in 'Name', with: new_name
      click_button 'Update Category'
    end

    it 'displays a success message' do
      expect(page).to have_text 'Category was successfully updated.'
    end

    it 'displays the updated Category' do
      expect(page).to have_text "Name: #{new_name}"
    end

    context 'when attempting to update the name to an existing category name' do
      let!(:another_category) { create(:category, name: "#{category.name} and still more!") }

      before do
        visit edit_category_path(category)

        fill_in 'Name', with: another_category.name
        click_button 'Update Category'
      end

      it 'displays an error message' do
        expect(page).to have_text 'Name has already been taken'
      end

      it 'returns to the new view' do
        expect(page).to have_current_path(edit_category_path(category))
      end
    end
  end
end
