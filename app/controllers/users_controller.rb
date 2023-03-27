class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    unless @user
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end

    @machines = @user.machines.all
  end
end
