class Appearance < ApplicationRecord
    belongs_to :episode
    belongs_to :guest

    validates :rating, numericality: {in: 1..5} 
    #validates :guest, uniqueness: true
end