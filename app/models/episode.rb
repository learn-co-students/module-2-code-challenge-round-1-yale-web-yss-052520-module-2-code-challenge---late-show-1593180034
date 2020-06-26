class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    def info
        "Episode #{self.number} - #{self.date.strftime("%B %d, %Y")}"
    end

    def avg_rating
        self.appearances.map(&:rating).sum / self.appearances.length if self.appearances.length != 0
    end
end
