class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances 

    # insert the minus sign because we need to sort in descending order
    def sorted_episodes
        self.episodes.sort_by {|episode| -episode.find_appearance_rating(self)}
    end
end
