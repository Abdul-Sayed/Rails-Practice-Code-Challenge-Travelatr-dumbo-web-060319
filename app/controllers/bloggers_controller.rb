class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    redirect_to blogger_path(@blogger)
  end

  def show
    find_blogger
    @posts = @blogger.posts
    @total_likes = @blogger.total_likes
    @most_liked_post = @blogger.most_liked_post
    @most_popular_destinations = @blogger.most_popular_destinations
  end

  private

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end
end
