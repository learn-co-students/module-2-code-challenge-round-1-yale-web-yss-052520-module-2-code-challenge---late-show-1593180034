class Appearance < ApplicationRecord
  belongs_to :episode
  belongs_to :guest

  validates :rating, inclusion: 1..5
  validates :guest, uniqueness: {scope: :episode, message: "already appeared on this episode"}
end
