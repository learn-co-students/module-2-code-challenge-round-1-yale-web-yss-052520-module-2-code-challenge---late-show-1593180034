class GuestsController < ApplicationController
  before_action :find_guest, only: [:show]
  def index
    @guests = Guest.all
  end

  def show 
  end 

  private 
  def find_guest
    @guest = Guest.find(params[:id])
  end 
end
