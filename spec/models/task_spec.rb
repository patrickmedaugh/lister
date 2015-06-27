require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'with valid params' do
    let(:task){
      Task.create()
    }
    it 'belongs to a list' do
      expect(task.list).to eq(nil)
    end
  end
end
