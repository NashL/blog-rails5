# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_many(:comments).dependent(:delete_all) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
