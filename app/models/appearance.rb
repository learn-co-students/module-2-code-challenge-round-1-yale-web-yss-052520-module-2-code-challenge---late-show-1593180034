class Appearance < ApplicationRecord
    belongs_to :episode
    belongs_to :guest

    validates :rating, inclusion: 1..5
    validates :guest_id, uniqueness: { scope: :episode_id }
end
