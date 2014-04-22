class Post < ActiveRecord::Base
  has_many :votes

  def vote_count
    votes.up.count - votes.down.count
  end

end
