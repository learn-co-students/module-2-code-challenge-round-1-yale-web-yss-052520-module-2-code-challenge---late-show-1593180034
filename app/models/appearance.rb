class Appearance < ApplicationRecord 
    belongs_to :guest 
    belongs_to :episode 

    validates :rating, numericality: {greater_than: 0, less_than: 6}
    
    # The commented line below does the same thing as the custom validation
    # I wrote. Only found this after googling at the end, so I'll keep my 
    # code just out of pride :)

    # validates :guest_id, uniqueness: {scope: [:guest_id, :episode_id]}
    
    validate :one_appearance 

    # Checks to see if any of the guests on this episode match 
    # the guest_id that was passed in 
    def one_appearance
        if self.episode.guests.include?(self.guest)
            errors.add(:appearance, "for a guest can't be repeated on the same episode")
        end 
    end 
end 