class Gamer < ActiveRecord::Base
    has_many :forums
    has_secure_password

    validates :name, :email, presence: true
end