class AppearancesController < ActionController::Base
    protect_from_forgery with: :exception
  
    def new
      @guests = Guest.all
      @episodes = Episode.all
      @appearance = Appearance.new
    end
  
    def create
      @appearance = Appearance.new(appearance_params)
      if @appearance.valid?
        @appearance.save
        redirect_to @appearance.episode
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
  