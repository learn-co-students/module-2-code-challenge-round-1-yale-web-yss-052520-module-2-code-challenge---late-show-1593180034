class AppearancesController < ApplicationController

    #for testing purposes
    def index
        @appearances = Appearance.all
    end
    def new
        @appearance = Appearance.new
        @guests = Guest.all
        @episodes = Episode.all
    end

    def create
        @appearance = Appearance.new(appearance_params)
        if @appearance.valid?
            @appearance.save
            @episode = Episode.find(@appearance.episode_id)
            redirect_to episode_path(@episode)
        else
            flash[:errors] = @appearance.errors.full_messages 
            redirect_to new_appearance_path
        end
    end

    def appearance_params
        params.require(:appearance).permit(:episode_id, :guest_id, :rating)
    end
  end
  