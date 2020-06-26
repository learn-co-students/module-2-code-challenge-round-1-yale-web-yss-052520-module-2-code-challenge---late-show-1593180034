class AppearancesController < ApplicationController

    def new
        @appearance = Appearance.new()
        @episodes = Episode.all
        @guests = Guest.all
    end

    def create
        # byebug
        appearance = Appearance.new(appearance_params)

        if appearance.valid?
            appearance.save
            redirect_to "/episodes/#{appearance.episode_id}"
        else
            flash[:errors] = appearance.errors.full_messages
            redirect_to "/appearances/new"   
        end
    end


    def appearance_params
        params.require(:appearance).permit(:rating, :episode_id, :guest_id)
    end
end
