class UserSampleSerializer < ActiveModel::Serializer
  attributes :id, :user, :sample
  # ,  :user_id, :sample_id

  # belongs_to :user 
  # belongs_to :sample 
end
