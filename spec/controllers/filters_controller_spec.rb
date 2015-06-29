require 'rails_helper'

RSpec.describe FiltersController, type: :controller do
  let(:list){
    List.create(id:33, title: "12")
  }
  let(:task){
    Task.create(id:14, title:"4", list_id:33)
  }
  it 'GET #status' do
    list;task
    get :status, :id => 14, :format => :json
    expect(response.content_type).to eq("application/json")
  end
  it 'GET #due_date' do
    list;task
    get :due_date, :id => 14, :format => :json
    expect(response.content_type).to eq("application/json")
  end
  it 'GET #title' do
    list;task
    get :title, :id => 14, :format => :json
    expect(response.content_type).to eq("application/json")
  end
end
