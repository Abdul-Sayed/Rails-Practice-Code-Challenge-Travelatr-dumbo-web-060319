class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def recent_five_posts
    self.posts.sort_by { |post| post.created_at }.first(5)
  end

  def most_liked_post
    @posts = self.posts
    @likes = 0
    @posts.each { |post|
      @likes = post.likes if post.likes > @likes
    }
    @most_liked = @posts.find { |post|
      post.likes == @likes
    }
    return @most_liked
  end

  def avg_blogger_age
    @posts = self.posts
    @ages = []
    @posts.each { |post|
      @ages << post.blogger.age
    }
    if @ages.length > 0
      @average = @ages.sum / @ages.length
    end
  end
end
