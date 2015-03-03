class Profile

  def initialize
    @profile_data = HTTParty.get("https://api.github.com/users/pkthunda",
          :headers => {
            "Authorization" => "token #{ENV['GITHUB_TOKEN']}",
            "User-Agent" => "pkthunda"})

    @repo_data = HTTParty.get("https://api.github.com/users/pkthunda/repos",
          :headers => {
            "Authorization" => "token #{ENV['GITHUB_TOKEN']}",
            "User-Agent" => "pkthunda"})

    @events_url = HTTParty.get("https://api.github.com/users/pkthunda/events{/privacy}",
          :headers => {
            "Authorization" => "token #{ENV['GITHUB_TOKEN']}",
            "User-Agent" => "pkthunda"})

  end

  def avatar
    @profile_data["avatar_url"]
  end

  def repo
    @repo_data
  end

  def event
    @events_url
  end
end
