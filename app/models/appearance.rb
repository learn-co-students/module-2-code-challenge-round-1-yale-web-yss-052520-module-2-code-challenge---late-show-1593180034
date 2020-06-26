class Appearance < ApplicationRecord
    belongs_to :guest
    belongs_to :episode

    validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
    # this makes it so that a guest can only have one appearance
        # validates :guest_id, uniquess: true
    # guest with many appearances, but only once per episode...
        # probably needs a helper method
    
end