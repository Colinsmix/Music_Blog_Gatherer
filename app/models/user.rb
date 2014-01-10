class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_taggable
  acts_as_voter


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :blogs, foreign_key: :submitter_id
  has_many :favorite_blogs
  # has_many :blogs, through: :favorites
  has_many :comments, inverse_of: :user
  
  validates_presence_of :email
  validates_format_of :email, :with => VALID_EMAIL_REGEX, :on => :create  
  validates_uniqueness_of :email

  def find_favorites
    favorite_blogs.map{|x| Blog.find(x.blog_id)}
  end


end
