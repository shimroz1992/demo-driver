require 'rails_helper'

RSpec.describe 'pay_laters/show', type: :view do
  before(:each) do
    @pay_later = assign(:pay_later, PayLater.create!(
                                      total_outstanding: 2.5,
                                      is_active: false,
                                      driver: nil
                                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
