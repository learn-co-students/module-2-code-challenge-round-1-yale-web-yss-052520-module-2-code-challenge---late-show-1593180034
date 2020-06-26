class Episode < ApplicationRecord
    has_many :appearances 
    has_many :guests, through: :appearances

    def find_appearance_rating(guest)
        self.appearances.find_by(guest_id: guest.id).rating
    end 

    def avg_rating 
        sum_ratings = self.appearances.sum(&:rating)
        (sum_ratings / self.appearances.length.to_f).round(2)
    end
end
