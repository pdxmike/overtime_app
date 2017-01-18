class PostsController < ApplicationController
  before_action :post_find, only: [:show, :update, :edit, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def show
  end

private
  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def post_find
    @post = Post.find(params[:id])
  end

end
