require 'rails_helper'

RSpec.describe 'pay_laters/edit', type: :view do
  before(:each) do
    @pay_later = assign(:pay_later, PayLater.create!(
                                      total_outstanding: 1.5,
                                      is_active: false,
                                      driver: nil
                                    ))
  end

  it 'renders the edit pay_later form' do
    render

    assert_select 'form[action=?][method=?]', pay_later_path(@pay_later), 'post' do
      assert_select 'input[name=?]', 'pay_later[total_outstanding]'

      assert_select 'input[name=?]', 'pay_later[is_active]'

      assert_select 'input[name=?]', 'pay_later[driver_id]'
    end
  end
end
