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
require 'rails_helper'

RSpec.describe LocalContact, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:trip) }
    it { should belong_to(:trip) }
  end
end
