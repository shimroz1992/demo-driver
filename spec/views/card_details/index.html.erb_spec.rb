require 'rails_helper'

RSpec.describe 'card_details/index', type: :view do
  before(:each) do
    assign(:card_details, [
             CardDetail.create!(
               card_no: 'Card No',
               expiry_month: 'Expiry Month',
               expiry_year: 2,
               is_active: false,
               is_default: false,
               driver: nil
             ),
             CardDetail.create!(
               card_no: 'Card No',
               expiry_month: 'Expiry Month',
               expiry_year: 2,
               is_active: false,
               is_default: false,
               driver: nil
             )
           ])
  end

  it 'renders a list of card_details' do
    render
    assert_select 'tr>td', text: 'Card No'.to_s, count: 2
    assert_select 'tr>td', text: 'Expiry Month'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
