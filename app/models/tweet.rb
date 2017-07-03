class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :subject, length: { maximum: 140}
end
