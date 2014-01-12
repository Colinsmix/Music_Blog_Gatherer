class BlogSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :tag_list, :favorite_user, :url

  def favorite_user
    if current_user
      object.check_favorite?(current_user.id)
    else
      false
    end
  end
end