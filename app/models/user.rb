class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_taggable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :blogs, inverse_of: :submitter
  has_many :favorites, inverse_of: :user
  has_many :comments, inverse_of: :user
  
  validates_presence_of :email
  validates_format_of :email, :with => VALID_EMAIL_REGEX, :on => :create  
  validates_uniqueness_of :email


end
