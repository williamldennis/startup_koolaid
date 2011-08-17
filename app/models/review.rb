# == Schema Information
# Schema version: 20110817195203
#
# Table name: reviews
#
#  id         :integer         not null, primary key
#  review_id  :integer
#  the_review :string(255)
#  bike_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Review < ActiveRecord::Base
  belongs_to :bike
  belongs_to :user
  
  attr_accessible :the_review, 
end
