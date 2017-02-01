class GithubService
  attr_reader :user_token, :conn, :user_name
  def initialize(user)
    @user_name  = user.name
    @user_token = user.token
    @conn       = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = user_token
    end
  end

  def user_info
    json_parse(conn.get '/user')
  end

  def user_repos
    json_parse(conn.get '/')
  end

  def json_parse(user_info)
    JSON.parse(user_info.body, symbolize_names: true)
  end
end
