class PostsController < ApplicationController
  before_action :post_find, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to post_path(@post), notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Your post was successfully deleted'
  end

private
  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def post_find
    @post = Post.find(params[:id])
  end

end
