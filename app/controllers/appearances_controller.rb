class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
    @episodes = Episode.all
    @guests = Guest.all
  end

  def create
    @appearance = Appearance.new(appearance_params)
    @episodes = Episode.all
    @guests = Guest.all
    if @appearance.valid?
      @appearance.save
      redirect_to episode_path(@appearance.episode)
    else
      flash[:alert] = @appearance.errors.full_messages
      render :new
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:episode_id, :guest_id, :rating)
  end

end
