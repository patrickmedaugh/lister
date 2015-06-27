require 'rails_helper'

RSpec.describe 'user' do
  context 'without an account' do
    it 'can create one' do
      visit root_path
      click_link "Sign Up"
      fill_in "Username", :with => "pmedaugh"
      fill_in "Password", :with => "password"
      fill_in "user[password_confirmation]", :with => "password"
      click_link_or_button "Submit"
      expect(page).to have_content("pmedaugh")
    end
    it 'receives a message when proper info is not given' do
      visit root_path
      click_link "Sign Up"
      fill_in "Username", :with => "pmedaugh"
      fill_in "Password", :with => "password"
      click_link_or_button "Submit"
      expect(page).to have_content("Invalid Info")
    end
  end
end
