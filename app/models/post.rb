class Post < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  def vote_count
    votes.recent.up.count - votes.recent.down.count
  end

end
