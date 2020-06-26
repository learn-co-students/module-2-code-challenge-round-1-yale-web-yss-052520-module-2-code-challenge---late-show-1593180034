class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    # def episode_rating(appearance)
    #     Appearance.find(appearance.id).rating
    # end
end
