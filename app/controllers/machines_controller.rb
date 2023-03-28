class MachinesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    if @user.nil?
      @user = User.find_by(id: params[:username])
      if @user.nil?
        render file: "#{Rails.root}/public/404.html", status: :not_found
        return
      end
    end

    @machine = @user.machines.find_by(name: params[:name])
    unless @machine
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end

  def new
    @machine = current_user.machines.new
  end

  def create
    @machine = current_user.machines.create(machine_params)
    if @machine.save
      redirect_to "/#{current_user.username}/#{ERB::Util.u(@machine.name)}", status: :see_other
    else
      flash[:alert] = "Error saving machine"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def machine_params
    params.require(:machine).permit(:name, :type, :brand, :model, :release_date, :production_date, :condition, :description)
  end
end
