class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances 

    def appearances_average_rating 
        self.apperances.average(&:rating)
    end
end
