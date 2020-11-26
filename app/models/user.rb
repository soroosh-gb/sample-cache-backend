class User < ApplicationRecord
    has_many :user_samples
    has_many :samples, through: :user_samples
    has_many :created_samples, through: :user_samples, :source => :samples
    has_many :comments
    has_many :samples

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }, presence: true
    validates :password, presence: true

    
end
