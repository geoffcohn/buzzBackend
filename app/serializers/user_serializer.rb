class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :latitude, :longitude, :friends


  def friends
    object.friends
  end
end
