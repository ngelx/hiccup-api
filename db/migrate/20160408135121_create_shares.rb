class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :trip_id, null:false, index: true
      t.string :public_url, null: false
      t.string :private_url
      t.string :password_encrypted
    end
  end
end
