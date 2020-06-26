class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    # byebug
    @episode = Episode.all.find(params[:id])
    @avg_rating = @episode.avg_rating
  end
end
