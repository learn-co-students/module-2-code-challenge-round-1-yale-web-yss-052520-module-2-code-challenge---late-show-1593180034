class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    def guests_sorted
        self.guests.sort_by(&:name)
    end
end
