class Guest < ApplicationRecord
    has_many :appearances 
    has_many :episodes, through: :appearances 

    def order_episodes 
        # returns array of episodes sorted by rating, descending 
        self.episodes.sort_by{|epi| epi.average_rating}.reverse
    end 
end
