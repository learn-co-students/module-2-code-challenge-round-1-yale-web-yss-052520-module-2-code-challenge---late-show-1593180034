class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances

    def show
        @guest = Guest.find(params[:id])
    end

end
