class FavoriteBlog < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :blog_id

  validates_uniqueness_of :user_id, scope: :blog_id

end
