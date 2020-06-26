class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show 
    @episode = current_episode 
  end 

  def current_episode
    Episode.find(params[:id]) 
  end 
end
