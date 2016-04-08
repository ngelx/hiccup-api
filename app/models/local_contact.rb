# encoding: utf-8
# == Schema Information
#
# Table name: local_contacts
#
#  id      :integer          not null, primary key
#  trip_id :integer          not null
#  name    :string           not null
#  email   :string
#  phone   :string
#
# Indexes
#
#  index_local_contacts_on_trip_id  (trip_id)
#

# frozen_string_literal: true
class LocalContact < ActiveRecord::Base
  belongs_to :trip

  validates :name, :trip, presence: true
end