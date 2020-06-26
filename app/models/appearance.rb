class Appearance < ApplicationRecord
    belongs_to :guest
    belongs_to :episode
    validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    validate :guest_appearance?

    def self.sort_appearances
        self.all.sort_by(&:rating).reverse
    end

    # if guest already been on episode then its not valid
    def guest_appearance?
        find_appearance = Appearance.find_by(episode_id: self.episode_id, guest_id: self.guest_id)
        if find_appearance!= nil and find_appearance.id!= self.id
            errors.add(:guest_id, "cannot be on the same episode twice!")
        end  
    end


end
