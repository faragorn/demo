class VehiclesController < ApplicationController
  before_filter :require_login
  before_filter :require_info
  before_filter :require_auth, only: [:show, :destroy, :edit, :update]

  def index
    @vehicles = current_user.vehicles
  end

  def new
    @vehicle = Vehicle.new
  end
  def create
    @vehicle = Vehicle.new(params[:vehicle])

    if @vehicle.valid?
      @vehicle.user = current_user
      @vehicle.save
      flash[:notice] = 'Vehicle was successfully saved!'
      redirect_to vehicles_url
    else
      render :action => 'new'
    end
  end
  def show

  end
  def destroy

  end

  private

  def require_login
    if current_user.nil?
      redirect_to sign_in_url
    end
  end

  def require_info
    if current_user.person.nil?
      flash[:notice] = 'Please complete your registration'
      redirect_to new_profile_url
    end
  end

  def require_auth
    id = params[:id]
    vehicle = Vehicle.find_by_id(id)

    if vehicle.nil? || vehicle.user != current_user
      flash[:error] = "Vehicle not found"
      redirect_to vehicles_url
    end

  end
end