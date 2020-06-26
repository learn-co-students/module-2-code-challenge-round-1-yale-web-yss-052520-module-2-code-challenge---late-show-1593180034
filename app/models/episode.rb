class Episode < ApplicationRecord
    has_many :appearances 
    has_many :guests, through: :appearances

    def guest_rating(guest_given)
        appearances.find_by(guest: guest_given).rating
    end

    def average_rating
        appearances.average(:rating)
    end
end
