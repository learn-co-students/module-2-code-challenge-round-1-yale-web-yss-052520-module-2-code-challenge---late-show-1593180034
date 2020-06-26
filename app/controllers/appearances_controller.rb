class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def new
    @guests = Guest.all
    @episodes = Episode.all

    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)

    if @appearance.valid?
      @appearance.save
      #redirect_to episode_path(@appearance.episode)
      redirect_to @appearance.episode
    else
      flash[:errors] = @appearance.errors.full_messages
      redirect_to new_appearance_path
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

  def current_appearance
    @appearance = Appearance.find(params[:id])
  end

end
