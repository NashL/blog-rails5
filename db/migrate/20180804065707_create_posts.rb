# frozen_string_literal: true

# app/db/migrate/20180804065707_create_posts.rb
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
