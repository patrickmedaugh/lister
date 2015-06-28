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
    it 'can edit a task' do
      user;list;task
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      click_link_or_button "Sample"
      click_link_or_button "Edit"
      fill_in 'task[title]', with: "testtitle"
      click_link_or_button "Update Task"
      expect(page).to have_content('testtitle')
    end
  end
end
