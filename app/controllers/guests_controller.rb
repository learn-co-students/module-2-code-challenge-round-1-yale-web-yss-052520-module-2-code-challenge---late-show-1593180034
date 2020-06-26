class GuestsController < ApplicationController

  before_action :current_guest, only: [:index, :show, :new, :edit, :update, :destroy, :create]

  def index
    @guests = Guest.all
  end

  def show
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :occupation)
  end

  def current_guest
    @guest = Guest.find(params[:id])
  end

end