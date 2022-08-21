require 'swagger_helper'

RSpec.describe 'drivers', type: :request do
  path '/drivers' do
    get('list drivers') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    # post('create driver') do
    #   response(200, 'successful') do

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end

  # path '/drivers/new' do

  #   get('new driver') do
  #     response(200, 'successful') do

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  # path '/drivers/{id}/edit' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'

  #   get('edit driver') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  # path '/drivers/{id}' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'

  #   get('show driver') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   patch('update driver') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   put('update driver') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   delete('delete driver') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  path '/drivers/{id}/card_details' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('card_details list') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  # path '/drivers/{id}/add_order' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'
  #   # parameter name: 'amount', in: :path, type: :string, description: 'amount'
  #   # parameter name: 'description', in: :path, type: :string, description: 'description'
  #   # parameter name: 'payment_type', in: :path, type: :string, description: 'payment_type'
  #   post('add_order') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }
  #       parameter name: :order, in: :body, schema: {
  #         type: :object,
  #         properties: {
  #           amount: { type: :string },
  #           description: { type: :string }
  #         },
  #         required: %w[amount description]
  #       }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  path '/drivers/{id}/add_order' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    post 'Creates a order' do
      consumes 'application/json'

      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          amount: { type: :integer },
          description: { type: :string },
          payment_type: { type: :integer }
        }
      }

      response '200', 'order created' do
        let(:order) { { amount: 'New Amount', description: 'New Description' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['amount']).to eq('New Order')
          new_books_in_db = Order.where(description: 'New Description').count
          expect(new_books_in_db).to eq(1)
        end
      end
    end
  end

  path '/drivers/{id}/add_wallet_history' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    post 'Creates a wallet history' do
      consumes 'application/json'

      parameter name: :wallet_history, in: :body, schema: {
        type: :object,
        properties: {
        }
      }

      response '200', 'wallet_history created' do
        let(:wallet_history) {}

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['amount']).to eq('New WalletHistory')
          new_books_in_db = WalletHistory.where(description: 'New Description').count
          expect(new_books_in_db).to eq(1)
        end
      end
    end
  end
end
