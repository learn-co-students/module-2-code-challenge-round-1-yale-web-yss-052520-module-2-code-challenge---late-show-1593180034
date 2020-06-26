class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances 

    def appearances_in_order
        self.episodes.sort_by{|episode| episode.appearances_average_rating }
    end

end
