class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances

    def sort_by_appearances
        
    end
end
