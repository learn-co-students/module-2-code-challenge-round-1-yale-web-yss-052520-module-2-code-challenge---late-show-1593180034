class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def show
    guest = Guest.find(params[:id])
    @guest_apperances = guest.appearances.sort_by(&:rating).reverse
  end
end
