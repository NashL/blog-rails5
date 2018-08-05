# frozen_string_literal: true

# spec/factories/comments.rb
FactoryBot.define do
  factory :comment do
    name { Faker::Lorem.name }
    description { Faker::Lorem.paragraph_by_chars(256, false) }
    post_id nil
  end
end
