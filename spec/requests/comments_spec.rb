# frozen_string_literal: true

# spec/requests/comments_spec.rb
require 'rails_helper'

RSpec.describe 'Comments API' do
  let!(:mypost) { create(:post) }
  let!(:comments) { create_list(:comment, 20, post_id: mypost.id) }
  let(:post_id) { mypost.id }
  let(:comment_id) { comments.first.id }

  describe 'GET posts/:post_id/comments' do
    before { get "/posts/#{post_id}/comments" }

    context 'when post exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all post comments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when post does not exists' do
      let(:post_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end

  describe 'GET /posts/:post_id/comments/:comment_id' do
    before { get "/posts/#{post_id}/comments/#{comment_id}" }

    context 'when post comment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns the comment' do
        expect(json['id']).to eq(comment_id)
      end
    end

    context 'when post comment does not exists' do
      let(:comment_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'POST /posts/:post_id/comments' do
    let(:valid_attributes) { { comment: { name: 'name at update', description: 'Description at Update'} } }

    context 'when request attributes are valid' do
      before { post "/posts/#{post_id}/comments", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request by invalid params' do
      before { post "/posts/#{post_id}/comments", params: { comment: {foo: 'bar'} } }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /posts/:post_id/comments/:comment_id' do
    let(:valid_attributes) { { comment: { name: 'name at update', description: 'Description at Update'} } }

    before { put "/posts/#{post_id}/comments/#{comment_id}", params: valid_attributes}

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the comment' do
        updated_comment = Comment.find(comment_id)
        expect(updated_comment.name).to match(/name at update/)
      end
    end

    context 'when the comment does not exists' do
      let(:comment_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'DELETE /posts/:post_id/comments/:comment_id' do
    before { delete "/posts/#{post_id}/comments/#{comment_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end