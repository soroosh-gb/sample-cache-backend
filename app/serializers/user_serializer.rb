class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :samples, :password_digest

  # has_many :user_samples
  # has_many :samples, through: :user_samples
  # has_many :created_samples, through: :user_samples, source: :samples
  # has_many :comments
end
