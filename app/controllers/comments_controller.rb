# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[index create]
  before_action :set_comment, only: %i[show update destroy]

  # GET /comments
  def index
    json_response @post.comments
  end

  # GET /comments/:id
  def show
    json_response(@comment)
  end

  # POST /comments
  def create
    @comment = @post.comments.create!(comment_params)
    json_response(@comment, :created)
  end

  # PUT /comments/:id
  def update
    @comment.update!(comment_params)
    head :no_content
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :description, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
