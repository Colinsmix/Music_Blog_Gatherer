class Vote < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  validates_presence_of :amount
end
