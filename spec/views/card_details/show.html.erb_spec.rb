require 'rails_helper'

RSpec.describe 'card_details/show', type: :view do
  before(:each) do
    @card_detail = assign(:card_detail, CardDetail.create!(
                                          card_no: 'Card No',
                                          expiry_month: 'Expiry Month',
                                          expiry_year: 2,
                                          is_active: false,
                                          is_default: false,
                                          driver: nil
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Card No/)
    expect(rendered).to match(/Expiry Month/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
