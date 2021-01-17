class User < ApplicationRecord
    has_many :likes
    has_many :comments
    has_many :posts
    has_many :cars
    has_secure_password
    validates :name, :username, :email, presence: true
    validates :username, :email, uniqueness: true

    

end
