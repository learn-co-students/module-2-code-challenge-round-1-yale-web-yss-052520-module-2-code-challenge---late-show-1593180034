class AppearancesController < ApplicationController 

    def new 
        @appearance = Appearance.new 
    end 

    def create 
        @appearance = Appearance.new(appearance_params)
        if @appearance.valid? 
            @appearance.save 
            redirect_to episode_path(@appearance.episode)
        else 
            flash[:errors] = @appearance.errors.full_messages 
            redirect_to "/appearances/new"
        end
    end
    
    private 

    def appearance_params 
        params.require(:appearance).permit(:rating, :episode_id, :guest_id)
    end



end 