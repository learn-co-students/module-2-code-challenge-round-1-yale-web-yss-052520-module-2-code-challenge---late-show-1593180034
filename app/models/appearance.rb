class Appearance < ApplicationRecord
    belongs_to :guest 
    belongs_to :episode 

    # make rating mandatory, in range of 1 to 5
    validates :rating, presence: true 
    validates :rating, {:inclusion => 1 .. 5 }
   
    validate :appear_once? 

    def appear_once? 
        # check if guest only appears once per episode 
        # form eliminates need to check if self.guest or self.episode != nil 
        apps_with_same_guest = Appearance.all.select{|app| app.guest == self.guest }
        apps_with_same_guest.each do |app| 
            if app.episode == self.episode 
                errors.add(:guest, "can't be on same episode twice!")
            end 
        end 
    end 

end
