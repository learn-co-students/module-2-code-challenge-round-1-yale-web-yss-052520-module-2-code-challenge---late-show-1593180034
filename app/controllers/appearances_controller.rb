class AppearancesController < ApplicationController
    def new 
        @appearance = Appearance.new 
        @guests = Guest.all 
        @episodes = Episode.all 
    end 

    def create 
        new_appearance = Appearance.new(appearance_params)
        if new_appearance.valid? 
            new_appearance.save 
            redirect_to episode_path(new_appearance.episode)
        else 
            flash[:errors] = new_appearance.errors.full_messages 
            redirect_to '/appearances/new'
        end 
    end 

    private 
    def appearance_params 
        params.require(:appearance).permit(:rating, :guest_id, :episode_id)
    end 
end