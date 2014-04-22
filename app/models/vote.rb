class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  enum direction: [:up, :down]
  scope :recent, -> { where(created_at: 1.week.ago..Time.now) }

  after_create :send_email

  def send_email
    VoteMailer.notification(post).deliver
  end

end
