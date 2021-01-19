class User < ApplicationRecord
    has_many :likes
    has_many :comments
    has_many :posts
    has_many :cars
    has_secure_password
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end

end
