class AddUserToTrip < ActiveRecord::Migration
  def change
    change_table :trips do |t|
      t.integer :user_id, null: true, default: nil, index:true
    end

  end
end
