class AppearancesController < ApplicationController

	# before_action :current_appearance, only: [:index] 

	def index
	    @appearances = Appearance.all
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
			redirect_to @appearance.guest
		else
			flash[:errors] = @appearance.errors.full_messages
			redirect_to new_appearance_path
		end

		# redirect_to "/episodes/#{@appearance.episode.id}"
	end


	private 

	def appearance_params
		params.require(:appearance).permit(:guest_id, :episode_id, :rating)
	end

	def current_appearance
		@appearance = Appearance.find(params[:id])
	end

end
