class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.string :story
      t.string :bus
      t.integer :busline

      t.timestamps
    end
  end
end
