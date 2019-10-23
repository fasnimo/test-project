class User < ActiveRecord::Base
    has_many :posts
    has_secure_password

    validates :name, :email, presence: true
end