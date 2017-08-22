class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comments, :photo_id, :username, :fieldname

end
