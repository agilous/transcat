# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/categories' do
  describe 'GET /index' do
    it 'renders a successful response' do
      get categories_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let!(:category) { create(:category) }

    it 'renders a successful response' do
      get category_url(category)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:category) { create(:category) }

    it 'renders a successful response' do
      get edit_category_url(category)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) { { name: 'Food' } }

      it 'creates a new Category' do
        expect do
          post categories_url, params: { category: valid_attributes }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        post categories_url, params: { category: valid_attributes }
        expect(response).to redirect_to(category_url(Category.last))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: nil } }

      it 'does not create a new Category' do
        expect do
          post categories_url, params: { category: invalid_attributes }
        end.not_to change(Category, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post categories_url, params: { category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:category) { create(:category) }
      let(:new_attributes) { { name: "#{category.name} and more!" } }

      it 'updates the requested category' do
        patch category_url(category), params: { category: new_attributes }
        category.reload
        expect(category.reload.name).to eq(new_attributes[:name])
      end

      it 'redirects to the category' do
        patch category_url(category), params: { category: new_attributes }
        category.reload
        expect(response).to redirect_to(category_url(category))
      end
    end

    context 'with invalid parameters' do
      let!(:category) { create(:category) }
      let(:invalid_attributes) { { name: nil } }

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch category_url(category), params: { category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:category) { create(:category) }

    it 'destroys the requested category' do
      expect do
        delete category_url(category)
      end.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories list' do
      delete category_url(category)
      expect(response).to redirect_to(categories_url)
    end
  end
end
