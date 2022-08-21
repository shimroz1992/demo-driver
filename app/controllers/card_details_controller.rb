class CardDetailsController < InheritedResources::Base
  private

  def card_detail_params
    params.require(:card_detail).permit(:card_no, :expiry_month, :expiry_year, :is_active, :is_default, :driver_id)
  end
end
