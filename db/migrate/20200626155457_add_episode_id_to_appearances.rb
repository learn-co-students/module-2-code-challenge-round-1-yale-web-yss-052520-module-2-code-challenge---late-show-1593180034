class AddEpisodeIdToAppearances < ActiveRecord::Migration[5.1]
  def change
    add_column :appearances, :episode_id, :integer
  end
end
