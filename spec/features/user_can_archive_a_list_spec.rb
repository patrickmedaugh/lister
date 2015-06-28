require 'rails_helper'

RSpec.describe 'user' do
  context 'with lists' do
    let(:user){
      User.create(id: 1, username: 'pmedaugh', password: 'password', password_confirmation: 'password')
    }
    let(:list){
      List.create(title:"Sample", user_id: 1)
    }
    it 'can archive a list' do
      user
      list
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      click_link_or_button "Archive"
      expect(page).to_not have_content("Sample")
    end
  end
end
