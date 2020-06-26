class EpisodesController < ApplicationController

  before_action :current_episode, only: [:index, :show, :new, :edit, :update, :destroy, :create]

  def index
    @episodes = Episode.all
  end

  def show
  end

  private

  def episode_params
    params.require(:episode).permit(:number, :date)
  end

  def current_episode
    @episode = Episode.find(params[:id])
  end
end
