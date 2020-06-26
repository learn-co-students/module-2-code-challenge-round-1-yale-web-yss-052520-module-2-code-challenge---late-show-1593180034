class Appearance < ApplicationRecord

    belongs_to :guest
    belongs_to :episode

    validates :rating, :inclusion => {in: 1..5, message: 'must be between 1 and 5'}
    validates :guest_id, uniqueness: {
        scope: [:episode_id], message: 'can only appear once on the same episode'
    }

    def self.find_rating (guest, episode)
        guest.appearances.find {|appearance| appearance.episode == episode }.rating
    end
end
