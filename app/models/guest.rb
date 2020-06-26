class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, :through => :appearances

    def episodes_sorted
        self.appearances.sort_by(&:rating)
    end    
end
