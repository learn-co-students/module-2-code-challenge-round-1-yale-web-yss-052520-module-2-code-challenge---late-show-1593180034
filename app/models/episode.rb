class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    def episode_number_and_date
        "Episode #{self.number} - #{self.date.strftime("%B %d, %Y")}"
    end

    def avg_appearance_rating
        if appearances.count != 0 
            all_ratings = []
            appearances.each do |a|
                all_ratings << a.rating 
            end
            # the answer I get is a rounded down version of the avg
            # because I set the ratings as only allowing integers not floats
            # but I can't come up with a validation that would allow ratings
            # to only be input as integers but have the average be a float... 
            avg_rating = all_ratings.sum / all_ratings.count
        else
            # it's not puts-ing... I think it needs to be in the show page rather than this method
            puts "There are no ratings for this Episode"
        end
    end

end
