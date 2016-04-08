# encoding: utf-8
# frozen_string_literal: true
# == Schema Information
#
# Table name: shares
#
#  id              :integer          not null, primary key
#  trip_id         :integer          not null
#  public_url      :string           not null
#  private_url     :string
#  password_digest :string
#
# Indexes
#
#  index_shares_on_trip_id  (trip_id)
#

require 'rails_helper'

RSpec.describe Share, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:public_url) }
    it { should validate_presence_of(:trip) }
    it { should belong_to(:trip) }
  end

  describe 'Private URL' do
    it { should respond_to(:password) }
    it { should respond_to(:authenticate) }

    context 'encrypt password' do
      subject(:share) { create(:share, password: 'abcd123') }

      it { expect(share.authenticate('abcd123')).to be share }
      it { expect(share.authenticate('no-password')).to be false }
    end
  end
end
