class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances
    
    def appearances_sorted_by_rating
        appearances.sort_by(&:rating).reverse
    end
end
