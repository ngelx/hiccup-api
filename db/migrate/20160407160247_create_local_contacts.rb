class CreateLocalContacts < ActiveRecord::Migration
  def change
    create_table :local_contacts do |t|
      t.integer :trip_id, null:false, index: true
      t.string :name, null:false
      t.string :email
      t.string :phone
    end
  end
end
