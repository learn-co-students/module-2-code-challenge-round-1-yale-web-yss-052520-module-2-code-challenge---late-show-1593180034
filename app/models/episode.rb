class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances 

    def appearances_average_rating 
        self.appearances.sum{|appearance| appearance.rating} / self.appearances.count
    end
end
