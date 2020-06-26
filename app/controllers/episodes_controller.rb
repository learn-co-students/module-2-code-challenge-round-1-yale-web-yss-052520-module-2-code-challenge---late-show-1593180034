class EpisodesController < ApplicationController
	before_action :current_episode, only: [:show] 


	def index
	    @episodes = Episode.all
	end

	def show
	end

	private

	def current_episode
		@episode = Episode.find(params[:id])
	end
end
