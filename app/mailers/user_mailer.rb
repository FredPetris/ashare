class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.inscription.subject
  #
  def sign_up
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.participate.subject
  #
  def participate(user, occurrence, owner)
    @user = user
    @event = occurrence.event
    @occurrence = occurrence

    mail to: owner.email, subject: "Nouveau participant sur #{@event.label}"
  end
end
