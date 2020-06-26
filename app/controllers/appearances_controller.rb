class AppearancesController < ApplicationController
    before_action :current_appearance, only: [:show, :edit, :update]

    def index
      @appearances = Appearance.all
    end

    def new
        @guests = Guest.all
        @episodes = Episode.all
        @appearance = Appearance.new
    end

    def create
        @appearance = Appearance.create(appearance_params)
        if @appearance.valid?
            @appearance.save
            redirect_to @appearance.episode
        else 
            flash[:errors] = @appearance.errors.full_messages
            redirect_to new_appearance_path
        end
    end
    
    def show
    end

    def edit
        @guests = Guest.all
        @episodes = Episode.all
    end 

    def update
        @appearance.update(appearance_params)
        redirect_to appearance_path(@appearance)
    end
        

    def appearance_params
        params.require(:appearance).permit(:rating)
    end
    
    def current_appearance
        @appearance = Appearance.find(params[:id])
    end    
    
end
  