# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    @posts = Post.all
    json_response @posts
  end

  # GET /posts/:id
  def show
    json_response(@post)
  end

  # POST /posts
  def create
    @post = Post.create!(post_params)
    json_response(@post, :created)
  end

  # PUT /posts/:id
  def update
    @post.update!(post_params)
    head :no_content
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find params[:id]
  end
end
