class Vote < ActiveRecord::Base
  belongs_to :post
  enum direction: [:up, :down]
  scope :recent, -> { where(created_at: 1.week.ago..Time.now) }
end
