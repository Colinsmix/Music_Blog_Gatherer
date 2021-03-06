class Blog < ActiveRecord::Base
  # VALID_URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
  acts_as_taggable
  acts_as_votable

  # before_save { |blog| blog.submitter = current_user }
  before_update { |blog| blog.tag_list.sort{|a,b| a<=>b }}

  belongs_to :submitter, class_name: 'User', foreign_key: :submitter_id

  has_many :comments, inverse_of: :blog
  has_many :users, through: :favorite_blogs
  has_many :favorite_blogs

  validates_presence_of :name

  validates_presence_of :url
  validates_uniqueness_of :url

  validates_presence_of :description
  # validates_format_of :url, :with => VALID_URL_REGEX, :on => :create

  def check_favorite?(id)
    favorite_blogs.where(user_id: id).any?
  end

  def self.search(search)
    if search
      Blog.includes(:tags).where('tags.name ILIKE ? OR blogs.name ILIKE ?',"%#{search}%", "%#{search}%").references(:tags)
    else
      scoped
    end
  end
end
