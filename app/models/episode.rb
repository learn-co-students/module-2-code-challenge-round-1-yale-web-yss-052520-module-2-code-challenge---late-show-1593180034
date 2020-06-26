class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    def average_rating
        if self.appearances.present?
            (self.appearances.map{|a| a.rating}.sum.to_f / self.appearances.count).round(1)
        else
            return 0
        end
    end
end
