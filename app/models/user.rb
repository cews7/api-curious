class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid:auth["uid"])
    user.image = auth["info"]["image"]
    user.token = auth["credentials"]["token"]
    user.name  = auth["info"]["name"]
    user.email  = auth["info"]["email"]
    user.login = auth["extra"]["raw_info"]["login"]
    user.save
    user
  end
end
