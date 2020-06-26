class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.all.find(params[:id])
    episodes = @guest.episodes
    @episodes_sorted = episodes.sort_by {|episode| Appearance.find_rating(@guest, episode)}.reverse!
  end
end
