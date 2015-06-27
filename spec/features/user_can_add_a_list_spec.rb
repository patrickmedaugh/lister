require 'rails_helper'

RSpec.describe 'user' do
  context 'with an account' do
    let(:user){
      User.create(id: 1, username: 'pmedaugh', password: 'password', password_confirmation: 'password')
    }
    it 'can create a list' do
      user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      click_link_or_button "New List"
      fill_in "list[title]", with: "SampleTitle"
      click_link_or_button "Create List"
      expect(page).to have_content("SampleTitle")
    end

    it 'can receive a message for untitled lists' do
      user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      click_link_or_button "New List"
      click_link_or_button "Create List"
      expect(page).to have_content("List must have a title")
    end
  end
end
