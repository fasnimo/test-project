class Forum < ActiveRecord::Base
    belongs_to :gamer
    validates :title, :body, presence: true
    validates :title, length: { minimum: 4 }

end