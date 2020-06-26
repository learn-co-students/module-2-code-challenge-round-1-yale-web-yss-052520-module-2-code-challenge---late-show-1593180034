class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances
    
    def display_ep
        "Episode #{number} - #{date.strftime("%B %d, %Y")}"
    end
    
    def avg_rating
        appearances.average(:rating).round(2)
    end
end
