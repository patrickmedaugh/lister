require 'rails_helper'

RSpec.describe List, type: :model do
  context 'with valid params' do
    let(:list){
      List.create()
    }
    it 'has tasks' do
      expect(list.tasks).to eq([])
    end
    it 'belongs to a user' do
      expect(list.user).to eq(nil)
    end
  end
end
