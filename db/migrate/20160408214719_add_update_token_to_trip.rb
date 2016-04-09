# encoding: utf-8
# frozen_string_literal: true
class AddUpdateTokenToTrip < ActiveRecord::Migration
  def change
    change_table :trips do |t|
      t.string :update_token, null: true, default: nil, index: true
    end
  end
end
