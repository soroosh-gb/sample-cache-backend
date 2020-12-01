class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user, :sample
  # , :text, :user, :sample

  # belongs_to :user
  # belongs_to :sample
end

# add_reference :samples, :user, null: false, foreign_key: true