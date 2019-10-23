class Post < ActiveRecord::Base
    belongs_to :user
    validates :title, :body, presence: true
    validates :title, length: { minimum: 3 }

end