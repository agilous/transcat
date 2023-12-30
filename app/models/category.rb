# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
