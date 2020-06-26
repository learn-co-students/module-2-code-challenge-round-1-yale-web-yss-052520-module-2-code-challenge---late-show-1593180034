class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances

    def episodes_order_by_rating
        episodes.sort_by {|episode| episode.guest_rating(self)}.reverse
    end
end
