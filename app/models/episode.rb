class Episode < ApplicationRecord
	has_many :appearances
	has_many :guests, through: :appearances


	def self.find_appearance(guest_id, episode_id)
		appearance = Appearance.all.find{|appearance| appearance.guest_id == guest_id && appearance.episode_id == episode_id}
	end
end
