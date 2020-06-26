class Guest < ApplicationRecord
has_many :appearances
has_many :episodes, through: :appearances 

def sorted
    self.episodes.sort_by{|episode| Appearance.find_by(episode_id: episode.id, guest_id: self.id).rating}.reverse   
end 

end
