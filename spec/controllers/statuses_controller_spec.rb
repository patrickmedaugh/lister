require 'rails_helper'

RSpec.describe StatusesController, type: :controller do
  context 'with a task'do
    let(:task){
      Task.create(id:4, title:"4")
    }
    it 'GET #pending' do
      task
      get :pending, :id => 4, :format => :json
      expect(response.content_type).to eq("application/json")
    end
    it 'GET #complete' do
      task
      get :completed, :id => 4, :format => :json
      expect(response.content_type).to eq("application/json")
    end
    it 'GET #title' do
      task
      get :incomplete, :id => 4, :format => :json
      expect(response.content_type).to eq("application/json")
    end
  end
end
