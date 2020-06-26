class AppearancesController < ApplicationController

    def new
        @episodes = Episode.all
        @guests = Guest.all
        @appearance = Appearance.new
    end

    def create
      @appearance = Appearance.new(allowed_params)
      if @appearance.valid?
        @appearance.save
        redirect_to @appearance.episode
      else
        flash[:errors] = @appearance.errors.full_messages
        redirect_to new_appearance_path
      end
    end

    private

    def allowed_params
        params.require(:appearance).permit(:episode_id, :guest_id, :rating)
    end
end