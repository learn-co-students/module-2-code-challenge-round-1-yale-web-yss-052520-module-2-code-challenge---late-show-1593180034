class Episode < ApplicationRecord
    has_many :appearances 
    has_many :guests, through: :appearances

    def avg_rating
        appearances.sum(&:rating) / appearances.length
    end
        
end
