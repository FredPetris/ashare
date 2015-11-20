module UsersHelper

  def user_organizer?
    @event.user_id == current_user.id
  end

end
