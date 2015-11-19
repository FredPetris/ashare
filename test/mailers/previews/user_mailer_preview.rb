class UserMailerPreview < ActionMailer::Preview
  def sign_up
    user = User.first
    UserMailer.welcome(user)
  end

  def participate
    user = User.first
    occurrence = Occurrence.first
    owner = User.last
    UserMailer.participate(user, occurrence, owner)
  end
end
