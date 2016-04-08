# encoding: utf-8
# frozen_string_literal: true
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
FactoryGirl.define do
  factory :local_contact do
    trip
    name 'MyString'
    email 'MyString'
    phone 'MyString'
  end
end
