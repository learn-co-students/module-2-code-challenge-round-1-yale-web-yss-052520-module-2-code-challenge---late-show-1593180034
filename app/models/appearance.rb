class Appearance < ApplicationRecord
    belongs_to :guest
    belongs_to :episode
    validates :rating, inclusion: { in: (1..5), message: "Rating must be between 1-5" }
    validates :guest, uniqueness: true
end
