# frozen_string_literal: true

# app/spec/factories/comments.rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end