require 'rails_helper'

RSpec.describe 'user' do
  context 'with a list' do
    let(:user){
      User.create(id: 1, username: 'pmedaugh', password: 'password', password_confirmation: 'password')
    }
    let(:list){
      List.create(id: 1, title:"Sample", user_id: 1)
    }
    it 'can add a task to it' do
      user;list
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      click_link_or_button "Sample"
      click_link_or_button "Add Task"
      fill_in 'task[title]', with: "testtitle"
      click_link_or_button "Create Task"
      expect(page).to have_content('testtitle')
    end
    it 'shows a message when no title is given' do
      user;list
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      click_link_or_button "Sample"
      click_link_or_button "Add Task"
      click_link_or_button "Create Task"
      expect(page).to have_content('Invalid fields')
    end
  end
end
