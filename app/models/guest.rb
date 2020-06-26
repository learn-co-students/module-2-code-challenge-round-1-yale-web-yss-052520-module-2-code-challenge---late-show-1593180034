class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances


    def sorted_appearances
        self.appearances.sort_by do |appearance|
            -appearance[:rating]
        end
    end

    def sorted_episodes
        sorted_appearances.map do |appearance|
            appearance.episode
        end
    end
end
