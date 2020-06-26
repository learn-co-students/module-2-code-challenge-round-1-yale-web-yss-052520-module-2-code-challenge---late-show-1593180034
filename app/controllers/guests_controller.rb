class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
    @sorted_appearances = @guest.appearances.sort_by{|a| a.rating}.reverse
  end
end
