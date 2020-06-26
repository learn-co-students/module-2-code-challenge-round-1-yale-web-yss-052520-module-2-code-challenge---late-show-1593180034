class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end
  
  def show 
    @guest = current_guest
  end 

  def current_guest
    Guest.find(params[:id]) 
  end 
end
