require 'rails_helper'

RSpec.describe 'user' do
  context 'with an account' do
    let(:user){
      User.create(id: 1, username: 'pmedaugh', password: 'password', password_confirmation: 'password')
    }
    it 'can login' do
      user
      visit root_path
      click_link "Login"
      fill_in "session[username]", :with => "pmedaugh"
      fill_in "session[password]", :with => "password"
      click_link_or_button "Login"
      expect(page).to have_content("pmedaugh")
    end
  end
  context 'without an account' do
    it 'receives an invalid login message' do
      visit root_path
      click_link "Login"
      fill_in "session[username]", :with => "pmedaugh"
      fill_in "session[password]", :with => "password"
      click_link_or_button "Login"
      expect(page).to have_content("Invalid Login")
    end
  end
end
