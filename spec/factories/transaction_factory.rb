# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    date { Time.zone.today }
    amount { rand(100..1000) }
    sequence(:description) { |i| "description-#{i}" }
  end
end
