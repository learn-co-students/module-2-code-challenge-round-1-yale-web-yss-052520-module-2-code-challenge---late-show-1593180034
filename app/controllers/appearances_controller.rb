class AppearancesController < ApplicationController

    before_action :current_appearance, only: [:index, :show, :new, :edit, :update, :destroy, :create]

    def index
      @appearances = Appearance.all
    end
  
    def show
    end

    def new
        @episodes = Episode.all
        @guests = Guest.all
        @appearance = Appearance.new
    end

    def create
        @appearance = Appearance.new(appearance_params)

        if @appearance.valid?
            @appearance.save
            redirect_to @appearance.episode
        else
            flash[:error] = @appearance.errors.full_messages
            redirect_to new_appearance_path
        end
    end

    def show
    end
  
    private
  
    def appearance_params
      params.require(:appearance).permit(:rating, :episode_ids, :guest_ids)
    end
  
    def current_appearance
      @appearance = Appearance.find(params[:id])
    end
end
