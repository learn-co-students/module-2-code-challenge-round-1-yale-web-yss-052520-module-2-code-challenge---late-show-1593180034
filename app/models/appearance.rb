class Appearance < ApplicationRecord
    belongs_to :guest
    belongs_to :episode

    validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6}
    validates :guest_id, uniqueness: { scope: :episode_id, message: '- this guest/episode combination already exists'}

end
