class Post < ActiveRecord::Base
  has_many :votes

  def vote_count
    votes.recent.up.count - votes.recent.down.count
  end

end
