class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :blog
  
  validates_presence_of :body
end
