class Guest < ApplicationRecord
  has_many :appearances
  has_many :episodes, through: :appearances

  def episodes_by_rating
    self.episodes.sort_by{|e| Appearance.find_by_ids(self.id, e.id).rating}.reverse!
  end
end
