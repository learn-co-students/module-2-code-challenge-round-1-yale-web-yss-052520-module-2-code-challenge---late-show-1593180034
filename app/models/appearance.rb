class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode

  validates :rating, inclusion: { in: 1..5, message: 'must be on a 1-5 scale.'}
  #validates :rating, numericality: { greater_than: 0 }
end
