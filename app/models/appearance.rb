class Appearance < ApplicationRecord
    belongs_to :episode
    belongs_to :guest

    validates :rating, inclusion: { in: 1..5, message: "must be a number between 1 and 5"}
    validates :guest, uniqueness: { scope: :episode, message: "can only appear once per episode"}
end
