class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances

    def ordered_appearances
        self.appearances.sort_by{|appearance| appearance.rating}.reverse
    end
end
