class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
    # redirect_to posts_path
  end

  def show
    find_post
    @blogger = @post.blogger
    @destination = @post.destination
  end

  def like
    find_post
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

  def edit
    find_post
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def update
    find_post
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:likes, :title, :content, :blogger_id, :destination_id)
  end
end
