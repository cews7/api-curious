class UserPresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def user_repos
    GithubService.new.user_repos(current_user)
  end

  def user_followers
    GithubService.new.user_followers(current_user)
  end

  def user_info
    GithubService.new.user_info(current_user)
  end

  def user_events
    GithubService.new.user_events(current_user)
  end

  private
  attr_reader :current_user
end
