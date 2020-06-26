class Episode < ApplicationRecord
has_many :appearances
has_many :guests, through: :appearances 

def average
    ratings = self.appearances.map {|appearance| appearance.rating}
    ratings.sum / ratings.count 
end 

end
