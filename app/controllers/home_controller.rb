class HomeController < ApplicationController
  def index
    unless user_signed_in?
      # I'll implement a landing page later
      # redirect_to user_session_path
      render 'landing_page'
      return
    end

    @collection = current_user.machines
    @explore = Machine.where(user: current_user)
                      .invert_where
                      .order("RANDOM()")
                      .limit(6)

    render
  end

  def explore
    @machines = Machine.order(created_at: :desc)
                       .page(params[:page])
                       .per(15)
  end
end
