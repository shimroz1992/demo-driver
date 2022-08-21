require 'application_system_test_case'

class DriversTest < ApplicationSystemTestCase
  setup do
    @driver = drivers(:one)
  end

  test 'visiting the index' do
    visit drivers_url
    assert_selector 'h1', text: 'Drivers'
  end

  test 'should create driver' do
    visit drivers_url
    click_on 'New driver'

    fill_in 'Address', with: @driver.address
    fill_in 'Date of birth', with: @driver.date_of_birth
    fill_in 'Licence d', with: @driver.licence_d
    fill_in 'Name', with: @driver.name
    fill_in 'User', with: @driver.user_id
    click_on 'Create Driver'

    assert_text 'Driver was successfully created'
    click_on 'Back'
  end

  test 'should update Driver' do
    visit driver_url(@driver)
    click_on 'Edit this driver', match: :first

    fill_in 'Address', with: @driver.address
    fill_in 'Date of birth', with: @driver.date_of_birth
    fill_in 'Licence d', with: @driver.licence_d
    fill_in 'Name', with: @driver.name
    fill_in 'User', with: @driver.user_id
    click_on 'Update Driver'

    assert_text 'Driver was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Driver' do
    visit driver_url(@driver)
    click_on 'Destroy this driver', match: :first

    assert_text 'Driver was successfully destroyed'
  end
end
