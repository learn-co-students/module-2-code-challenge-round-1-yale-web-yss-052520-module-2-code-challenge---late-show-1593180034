class AppearancesController < ApplicationController
    def new
        @appearance = Appearance.new
        @guests = Guest.all
        @episodes = Episode.all
        # @episode = Episode.find(params[:episode_id])
    end

    def create
        @appearance = Appearance.new(appearance_params)
        if @appearance.valid?
            @appearance.save
            redirect_to "/episodes/#{appearance_params[:episode_id]}"
        else 
            flash[:errors] = @appearance.errors.full_messages
            redirect_to new_appearance_path
        end
end

    private 
    def appearance_params
        params.require(:appearance).permit(:rating, :guest_id, :episode_id)
    end

    def current_appearance
        @appearance = Appearance.find(params[:id])
    end

end