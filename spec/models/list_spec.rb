require 'rails_helper'

RSpec.describe List, type: :model do
  context 'with valid params' do
    let(:user){
      User.create(id: 1, password: 'yo', password_confirmation: 'yo')
    }
    let(:list){
      List.create(user_id: 1)
    }
    it 'has tasks' do
      user
      expect(list.tasks).to eq([])
    end
    it 'belongs to a user' do
      user
      expect(list.user).to eq(user)
    end
  end
end
