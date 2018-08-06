# frozen_string_literal: true

# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[show update destroy]

  # GET /posts/:post_id/comments
  def index
    json_response @post.comments
  end

  # GET /posts/:post_id/comments/:id
  def show
    json_response(@comment)
  end

  # POST /posts/:post_id/comments
  def create
    @comment = @post.comments.create!(comment_params)
    json_response(@comment, :created)
  end

  # PUT /posts/:post_id/comments/:id
  def update
    @comment.update!(comment_params)
    head :no_content
  end

  # DELETE /posts/:post_id/comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :description)
  end

  def set_comment
    @comment = @post.comments.find(params[:id]) if @post
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
