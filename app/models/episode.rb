class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances  

    def average_rating 
        # returns average rating of all appearances for this episode 
        # if no ratings were provided, returns message 
        total = self.appearances.sum{|app| app.rating} 
        if total == 0 
            return "No ratings!"
        end 
        return (total.to_f / self.appearances.length).round(2) 
    end 
end
