class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :blogs
  has_many :favorites
  has_many :comments
  has_many :votes

  validates_presence_of :username
  validates_uniqueness_of :username
  
  validates_presence_of :password
  
  validates_presence_of :email
  validates_format_of :email, :with => VALID_EMAIL_REGEX, :on => :create  
  validates_uniqueness_of :email


end
