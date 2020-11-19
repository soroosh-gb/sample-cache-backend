class Sample < ApplicationRecord
    has_many    :user_samples
    has_many    :users, through: :user_samples
    belongs_to  :creator, foreign_key: :user_id, class_name:'User'
    has_many    :comments
end
