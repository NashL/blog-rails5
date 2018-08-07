# frozen_string_literal: true

# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post, dependent: :destroy

  validates_presence_of :name, :description
end
