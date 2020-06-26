class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances
    def sort_by_ratings
        self.episodes.sort_by{|e|
            e.appearances.first.rating
        }
    end
end
