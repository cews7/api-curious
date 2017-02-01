require 'rails_helper'

describe 'login page' do
  it '/auth/github' do
    visit "/"
    stub_omniauth

    expect(page.status_code).to eq(200)
    expect(current_path).to eq(root_path)

    expect(page).to have_content("Sign in with Github")

    click_on 'Sign in with Github'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, Eric!")
  end
end
