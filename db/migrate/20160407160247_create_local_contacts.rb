# encoding: utf-8
# frozen_string_literal: true
class CreateLocalContacts < ActiveRecord::Migration
  def change
    create_table :local_contacts do |t|
      t.integer :trip_id, null: false, index: true
      t.string :name
      t.string :email
      t.string :phone
    end
  end
end
