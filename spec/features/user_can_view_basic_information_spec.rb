require 'rails_helper'

  describe "When I visit login page" do
    it "I can enter my credentials to login" do
      stub_omniauth
       visit "/"
       click_on "login"

       expect(current_path).to eq root_path
       expect(page).to have_content("Welcome, Eric!")
    end
  end
