class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances 

    def appearances_highest_rated_first
        self.appearances.sort_by{|appearance| appearance.rating }.reverse_each
    end

end
