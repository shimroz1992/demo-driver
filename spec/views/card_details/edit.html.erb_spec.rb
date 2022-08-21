require 'rails_helper'

RSpec.describe 'card_details/edit', type: :view do
  before(:each) do
    @card_detail = assign(:card_detail, CardDetail.create!(
                                          card_no: 'MyString',
                                          expiry_month: 'MyString',
                                          expiry_year: 1,
                                          is_active: false,
                                          is_default: false,
                                          driver: nil
                                        ))
  end

  it 'renders the edit card_detail form' do
    render

    assert_select 'form[action=?][method=?]', card_detail_path(@card_detail), 'post' do
      assert_select 'input[name=?]', 'card_detail[card_no]'

      assert_select 'input[name=?]', 'card_detail[expiry_month]'

      assert_select 'input[name=?]', 'card_detail[expiry_year]'

      assert_select 'input[name=?]', 'card_detail[is_active]'

      assert_select 'input[name=?]', 'card_detail[is_default]'

      assert_select 'input[name=?]', 'card_detail[driver_id]'
    end
  end
end
