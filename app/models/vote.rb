class Vote < ActiveRecord::Base
  validate_presence_of :user_id

  belongs_to :user
  belongs_to :voteable, polymorphic: true
end
