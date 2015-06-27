require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with valid params' do
    let(:user){
      User.create()
    }
    it 'has lists' do
      expect(user.lists).to eq([])
    end
  end
end
