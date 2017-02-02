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

  context 'user_repos' do
    it 'returns a list of repos for a given user' do
      user = OpenStruct.new(
      name: "cews7",
      token: ENV['TOKEN']
      )

      user_repos = GithubService.new(user).user_repos

      expect(user_repos.class).to eq(Array)
      expect(user_repos.first).to have_key(:name)
      expect(user_repos.first).to have_key(:description)
    end
  end

  context 'user_followers' do
    it 'returns a list of followers' do
      user = OpenStruct.new(
      name: "cews7",
      token: ENV['TOKEN']
      )

      user_followers = GithubService.new(user).user_followers

      expect(user_followers.class).to eq(Array)
      expect(user_followers.first).to be_a(Hash)
      expect(user_followers.count).to eq 2
      expect(user_followers.first).to have_key(:login)
      expect(user_followers.first).to have_key(:site_admin)
    end
  end

  context 'user_events' do
    it 'returns events for a given user' do
      user = OpenStruct.new(
      name: "cews7",
      token: ENV['TOKEN']
      )

      user_events = GithubService.new(user).user_events
      # binding.pry
      expect(user_events.class).to eq(Array)
      expect(user_events.first).to be_a(Hash)
      expect(user_events.first).to have_key(:type)
      expect(user_events.first).to have_key(:repo)
    end
  end
end
