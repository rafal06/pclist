class MachinesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    unless @user
      render file: "#{Rails.root}/public/404.html", status: :not_found
      return
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
      redirect_to machine_path(current_user.username, @machine.name)
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
    @machine = current_user.machines.find_by(id: params[:id])
    if @machine.user != current_user
      flash[:alert] = "You are not permitted to perform this action"
      redirect_to machine_path(@machine.user.username, @machine.name)
    end

    if @machine.destroy!
      flash[:notice] = "Machine #{@machine.name} was successfully deleted"
      redirect_to user_path(current_user.username)
    else
      flash[:alert] = "Error deleting #{@machine.name}"
      redirect_to machine_path(@user.username, @machine.name)
    end
  end

  private
  def machine_params
    params.require(:machine).permit(:name, :type, :brand, :model, :release_date, :production_date, :condition, :image, :description)
  end
end
