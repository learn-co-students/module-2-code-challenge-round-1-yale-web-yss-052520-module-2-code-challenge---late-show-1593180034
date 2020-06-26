class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    def avg_app_rating
        ratings = self.appearances.map{|appearance| appearance.rating}
        ratings.inject(0){|sum, rating| sum + rating} / ratings.size
    end
end
