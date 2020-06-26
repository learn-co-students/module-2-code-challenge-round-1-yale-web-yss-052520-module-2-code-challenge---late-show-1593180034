class Episode < ApplicationRecord
  has_many :appearances
  has_many :guests, through: :appearances

  def title
    "Episode " + self.number.to_s + " – " + self.date.strftime('%B %d, %Y')
  end

  def nice_date
    self.date.strftime('%B %d, %Y')
  end

  def average_rating
    if Appearance.where(episode_id: self.id).empty? == false
      appearances = Appearance.where(episode_id: self.id)
      ratings = appearances.map { |appearance| appearance.rating }
      ratings.sum / ratings.length
    end
  end

end
