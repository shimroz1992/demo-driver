class PayLatersController < InheritedResources::Base
  private

  def pay_later_params
    params.require(:pay_later).permit(:total_outstanding, :is_active, :driver_id)
  end
end
