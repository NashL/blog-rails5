# frozen_string_literal: true

# app/db/migrate/20180804065850_create_comments.rb
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :description
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
