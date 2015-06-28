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
      Task.create(id: 1, title:"testtask", status: 'incomplete', list_id: 1)
    }
    it 'can edit a task' do
      user;list;task
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit('/lists/1')
      click_link "Edit"
      fill_in 'task[title]', with: "testtitle"
      click_link_or_button "Update Task"
      expect(page).to have_content('testtitle')
    end
    it 'can receive a message when task is not valid' do
      user;list;task
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit('/lists/1')
      click_link "Edit"
      fill_in 'task[title]', with: ""
      click_link_or_button "Update Task"
      expect(page).to have_content('Invalid fields')
    end
  end
end
