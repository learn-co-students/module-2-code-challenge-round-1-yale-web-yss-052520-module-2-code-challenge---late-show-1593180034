class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def appearance_params
    params.require(:episode).permit(:date, :number)
  end
end
