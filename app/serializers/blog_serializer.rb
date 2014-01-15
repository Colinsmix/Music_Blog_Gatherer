class BlogSerializer < ActiveModel::Serializer
  attributes :id, :favorite_user

  def favorite_user
    if current_user
      object.check_favorite?(current_user.id)
    else
      false
    end
  end
end
