# frozen_string_literal: true

# app/models/post.rb
class Post < ApplicationRecord
  has_many :comments

  validates_presence_of :title, :content
end
