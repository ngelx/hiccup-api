# encoding: utf-8
# frozen_string_literal: true
FactoryGirl.define do
  factory :local_contact do
    trip
    name 'MyString'
    email 'MyString'
    phone 'MyString'
  end
end
