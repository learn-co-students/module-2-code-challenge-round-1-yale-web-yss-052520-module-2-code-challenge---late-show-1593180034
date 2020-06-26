class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances

    def sort_by_rating
        self.appearances.sort_by(&:rating).reverse
    end
end
