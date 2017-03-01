class PostsController < ApplicationController
  before_action :post_find, only: [:show, :update, :edit, :destroy, :approve]

  def index
    @posts = Post.posts_by(current_user).page(params[:page]).per(15)
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
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was successfully updated'
    else
      render :edit
    end
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: 'The OT Request has been approved'
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Your post was successfully deleted'
  end

private
  def post_params
    params.require(:post).permit(:date, :rationale, :daily_hours, :status)
  end

  def post_find
    @post = Post.find(params[:id])
  end

end
