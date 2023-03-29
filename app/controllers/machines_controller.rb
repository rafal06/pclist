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
    authenticate_user!
    @machine = current_user.machines.new
  end

  def create
    authenticate_user!
    @machine = current_user.machines.create(machine_params)
    if @machine.save
      redirect_to machine_path(current_user, @machine.name)
    else
      flash[:alert] = "Error saving machine"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authenticate_user!
    @machine = current_user.machines.find_by(name: params[:name])
  end

  def update
    authenticate_user!
    @machine = current_user.machines.find_by(name: params[:name])
    if @machine.update(machine_params)
      redirect_to machine_path(current_user.username, @machine.name)
    else
      flash[:alert] = "Error updating machine"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authenticate_user!
  end

  private
  def machine_params
    params.require(:machine).permit(:name, :type, :brand, :model, :release_date, :production_date, :condition, :description)
  end
end
