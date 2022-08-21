module Api
  module V1
    class DriversController < ApplicationController
      respond_to :json

      swagger_controller :drivers, 'Drivers'

      swagger_api :index do
        summary 'Returns all drivers'
        notes 'Notes...'
      end

      def index
        @drivers = Driver.all
        message = @drivers.present? ? 'Driver List' : 'No drivers present'
        data = {
          data: @drivers,
          message:
        }

        render json: data, status: :ok
      end

      def card_details
        @driver = Driver.find_by(params[:id])
        @card_details = @driver.card_details

        render json: @card_details, status: :ok
      end

      def add_order
        # @driver = Driver.find_by(params[:id])
        @driver = Driver.find_by(id: params[:driver_id])
        @order = @driver.orders.new(amount: params[:amount], description: params[:description],
                                    payment_type: params[:payment_type])
        if @order.save
          @payment = @order.payment_histories.create(amount: @order.amount, payment_on_id: @order.id,
                                                     payment_type: @order.payment_type, paymentable_type: 'Order', paymentable_id: 2, user_id: @driver.user.id)
        end
        @card_details = @driver.card_details

        render json: @order, status: :ok
      end

      def add_wallet_history
        CreateWalletHistory.new(driver_id: params[:driver_id]).create_wallet_history
        data = { message: 'successful' }
        render json: data, status: :ok
      end
    end
  end
end
