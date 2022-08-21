class DriversController < InheritedResources::Base
  def index
    debugger
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :address, :licence_d, :date_of_birth, :user_id)
  end
end
