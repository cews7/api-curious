class UserPresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def repos
    GithubService.new.user_repos
  end

  def followers
    GithubService.new.user_followers
  end

  def info
    GithubService.new.user_info
  end

  def events
    GithubService.new.user_events
  end
end
