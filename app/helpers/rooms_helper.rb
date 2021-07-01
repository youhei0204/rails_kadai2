module RoomsHelper
  def owner?(room)
    logged_in? && current_user.rooms.include?(room)
  end
end
