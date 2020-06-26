class Appearance < ApplicationRecord
    belongs_to :episode
    belongs_to :guest

    validates :rating, numericality: {greater_than_or_equal_to: 1, message: "must be between 1 and 5, inclusive"}
    validates :rating, numericality: {less_than_or_equal_to: 5, message: "must be between 1 and 5, inclusive"}
    validates :guest_id, uniqueness: {scope: :episode, message: "can only appear in an episode once"}
end