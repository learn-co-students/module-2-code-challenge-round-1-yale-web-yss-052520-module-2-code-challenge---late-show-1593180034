class AddGuestIdToAppearances < ActiveRecord::Migration[5.1]
  def change
    add_column :appearances, :guest_id, :integer
  end
end
