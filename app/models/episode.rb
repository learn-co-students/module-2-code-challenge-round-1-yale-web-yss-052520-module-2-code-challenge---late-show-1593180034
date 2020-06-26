class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    def guest_rating(input_guest)
        appearances.find_by(guest: input_guest).rating
    end

    def average_rating
        appearances.average(:rating)
    end
end
