class Blog < ActiveRecord::Base
  # VALID_URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :votes

  validates_presence_of :name
  
  validates_presence_of :url
  validates_uniqueness_of :url
  # validates_format_of :url, :with => VALID_URL_REGEX, :on => :create


  
end
