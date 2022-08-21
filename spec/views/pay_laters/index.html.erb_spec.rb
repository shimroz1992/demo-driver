require 'rails_helper'

RSpec.describe 'pay_laters/index', type: :view do
  before(:each) do
    assign(:pay_laters, [
             PayLater.create!(
               total_outstanding: 2.5,
               is_active: false,
               driver: nil
             ),
             PayLater.create!(
               total_outstanding: 2.5,
               is_active: false,
               driver: nil
             )
           ])
  end

  it 'renders a list of pay_laters' do
    render
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
