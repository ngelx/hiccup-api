# encoding: utf-8
# frozen_string_literal: true
class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :trip_id, null: false, index: true
      t.string :public_url, null: false
      t.string :private_url
      t.string :password_digest
    end
  end
end
