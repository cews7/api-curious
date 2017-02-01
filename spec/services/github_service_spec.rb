require 'rails_helper'

describe GithubService do
  context 'user_info' do
    it 'retrieves user info' do

      user = OpenStruct.new(
      name: "cews7",
      token: ENV['TOKEN']
      )

      user_info = GithubService.new(user).user_info

      expect(user_info).to be_a(Hash)
      expect(user_info[:name]).to eq("Eric Wahlgren-Sauro")
      expect(user_info[:plan]).to be_a(Hash)
    end
  end
end
