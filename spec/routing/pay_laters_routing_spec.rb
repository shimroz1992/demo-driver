require 'rails_helper'

RSpec.describe PayLatersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/pay_laters').to route_to('pay_laters#index')
    end

    it 'routes to #new' do
      expect(get: '/pay_laters/new').to route_to('pay_laters#new')
    end

    it 'routes to #show' do
      expect(get: '/pay_laters/1').to route_to('pay_laters#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/pay_laters/1/edit').to route_to('pay_laters#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/pay_laters').to route_to('pay_laters#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/pay_laters/1').to route_to('pay_laters#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/pay_laters/1').to route_to('pay_laters#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/pay_laters/1').to route_to('pay_laters#destroy', id: '1')
    end
  end
end
