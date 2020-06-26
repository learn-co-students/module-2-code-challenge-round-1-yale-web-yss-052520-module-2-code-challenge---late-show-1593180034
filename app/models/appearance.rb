class Appearance < ApplicationRecord
    belongs_to :episode 
    belongs_to :guest 
    validates :rating, numericality: {greater_than: 0, less_than: 6} 
    validates :guest_id, uniqueness: {scope: :episode, message: "has already been on this episode"}
end
