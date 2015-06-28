require 'rails_helper'

RSpec.describe 'user' do
  context 'with a list' do
    let(:user){
      User.create(id: 1, username: 'pmedaugh', password: 'password', password_confirmation: 'password')
    }
    let(:list){
      List.create(id: 1, title:"Sample", user_id: 1)
    }
    let(:task){
      Task.create(id: 1, title:"testtask", list_id: 1)
    }
    it 'can delete a task' do
      user;list;task
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit('/lists/1')
      expect(page).to have_content("testtask")
      click_link "Delete"
      expect(page).to_not have_content("testtask")
    end
  end
end
