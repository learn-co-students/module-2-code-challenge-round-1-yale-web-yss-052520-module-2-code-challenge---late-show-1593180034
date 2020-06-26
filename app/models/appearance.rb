class Appearance < ApplicationRecord
  belongs_to :episode
  belongs_to :guest
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "must be on a scale of 1-5"}
  validate :is_unique_this_episode

  def self.find_by_ids(guest_id, episode_id)
    Appearance.find_by(guest_id: guest_id, episode_id: episode_id)
  end


  def is_unique_this_episode
    if Appearance.find_by(guest_id: self.guest_id, episode_id: self.episode_id)
      errors.add(:guest, "can't appear twice on the same episode")
    end
  end

  

end
