# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { ['Clothing', 'Dining Out', 'Groceries', 'Rent', 'Transportation'].sample }
  end
end
