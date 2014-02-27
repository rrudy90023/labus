class AddUserIdToRiders < ActiveRecord::Migration
  def change
    add_column :riders, :user_id, :integer
    add_index :riders, :user_id
  end
end
