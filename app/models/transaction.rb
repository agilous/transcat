# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :amount, presence: true
  validates :date, presence: true
  validates :description, presence: true

  belongs_to :category, optional: true
end
