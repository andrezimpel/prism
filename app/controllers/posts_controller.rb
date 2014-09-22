class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @title = "Blog"
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @title = @post.title
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.where(permalink: params[:title]).first
    end
end
