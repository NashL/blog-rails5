# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should belong_to(:post) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
