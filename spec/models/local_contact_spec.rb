require 'rails_helper'

RSpec.describe LocalContact, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:trip)}
    it {should belong_to(:trip) }
  end
end
