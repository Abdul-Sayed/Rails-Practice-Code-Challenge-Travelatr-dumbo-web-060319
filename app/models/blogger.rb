class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def total_likes
    @posts = self.posts
    @total_likes = 0
    @posts.each { |post|
      @total_likes += post.likes
    }
    @total_likes
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
  end

  def most_popular_destinations
    @destinations = []
    self.posts.each { |post|
      @destinations << post.destination
    }
    @destinations.sort_by { |destination| destination.posts.count }.last(5).reverse
  end
end
