class AppearancesController < ApplicationController



    def new
        @appearance = Appearance.new 
        @guests = Guest.all 
        @episodes = Episode.all 
    end

    def create
        # byebug
        @appearance = Appearance.new(appearance_params)
        if @appearance.valid?
            @appearance.save 
            @episode = Episode.find(appearance_params[:episode_id])
            redirect_to episode_path(@episode)
        else
            flash[:errors] = @appearance.errors.full_messages
            redirect_to new_appearance_path 
        end

    
    end



    private

    def appearance_params
        params.require(:appearance).permit(:rating, :guest_id, :episode_id)
    end
end
