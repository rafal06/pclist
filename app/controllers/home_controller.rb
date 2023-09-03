class HomeController < ApplicationController
  def index
    unless user_signed_in?
      # I'll implement a landing page later
      redirect_to user_session_path
      return
    end

    @collection = current_user.machines
    @explore = Machine.where(user: current_user)
                      .invert_where
                      .order("RANDOM()")
                      .limit(6)

    render
  end
end
