require 'rails_helper'

RSpec.describe 'card_details/new', type: :view do
  before(:each) do
    assign(:card_detail, CardDetail.new(
                           card_no: 'MyString',
                           expiry_month: 'MyString',
                           expiry_year: 1,
                           is_active: false,
                           is_default: false,
                           driver: nil
                         ))
  end

  it 'renders new card_detail form' do
    render

    assert_select 'form[action=?][method=?]', card_details_path, 'post' do
      assert_select 'input[name=?]', 'card_detail[card_no]'

      assert_select 'input[name=?]', 'card_detail[expiry_month]'

      assert_select 'input[name=?]', 'card_detail[expiry_year]'

      assert_select 'input[name=?]', 'card_detail[is_active]'

      assert_select 'input[name=?]', 'card_detail[is_default]'

      assert_select 'input[name=?]', 'card_detail[driver_id]'
    end
  end
end
