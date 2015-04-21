class AddDeskPreferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :desk_preference, :string
  end
end
