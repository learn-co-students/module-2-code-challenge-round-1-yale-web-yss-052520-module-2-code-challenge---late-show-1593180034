class AppearancesController < ApplicationController
    def index
        @appearances = Appearance.all
    end

    def new
        @appearance = Appearance.new
        @episodes = Episode.all
        @guests = Guest.all
    end

    def create
        appearance = Appearance.new(appearance_params)
        
        if appearance.valid?
            appearance.save
            redirect_to appearance.episode
        else
            flash[:errors] = appearance.errors.full_messages
            redirect_to "/appearances/new"
        end
    end

    private

    def appearance_params
        params.require(:appearance).permit(:rating, :episode_id, :guest_id)
    end

    def current_appearance
    end
end