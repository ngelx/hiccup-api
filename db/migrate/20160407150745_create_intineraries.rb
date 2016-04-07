class CreateIntineraries < ActiveRecord::Migration
  def change
    create_table :intineraries do |t|
      t.integer :trip_id, null: false, index: true
      t.string :start_location
      t.string :end_location
      t.datetime :start_time
      t.datetime :end_time
      t.integer :water
      t.integer :hammok
      t.boolean :fishing
      t.string :forecast
    end
  end
end
