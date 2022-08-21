require 'rails_helper'

RSpec.describe CardDetailsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/card_details').to route_to('card_details#index')
    end

    it 'routes to #new' do
      expect(get: '/card_details/new').to route_to('card_details#new')
    end

    it 'routes to #show' do
      expect(get: '/card_details/1').to route_to('card_details#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/card_details/1/edit').to route_to('card_details#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/card_details').to route_to('card_details#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/card_details/1').to route_to('card_details#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/card_details/1').to route_to('card_details#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/card_details/1').to route_to('card_details#destroy', id: '1')
    end
  end
end
