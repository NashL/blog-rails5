# frozen_string_literal: true

# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph_by_chars(512, false) }
  end
end
