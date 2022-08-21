require 'rails_helper'

RSpec.describe 'pay_laters/new', type: :view do
  before(:each) do
    assign(:pay_later, PayLater.new(
                         total_outstanding: 1.5,
                         is_active: false,
                         driver: nil
                       ))
  end

  it 'renders new pay_later form' do
    render

    assert_select 'form[action=?][method=?]', pay_laters_path, 'post' do
      assert_select 'input[name=?]', 'pay_later[total_outstanding]'

      assert_select 'input[name=?]', 'pay_later[is_active]'

      assert_select 'input[name=?]', 'pay_later[driver_id]'
    end
  end
end
