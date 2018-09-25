describe 'Test 1: Create Bookings' do
  it 'Create 2 bookings' do
    # Open App
    @driver.get 'http://hotel-test.equalexperts.io/'

    @first_name = random_string(8)
    @surname = random_string(8)

    @booking_form.add_booking('test', 'one', '9139.99', 'true', '2018-09-24', '2018-09-25')
    @booking_form.add_booking(@first_name, @surname, '99.99', 'false', '2018-09-24', '2018-09-25')

    wait_for_ajax
    expect(@booking_form.row.last(2).first.find_elements(css: 'div')[0].text).to eql @first_name
    expect(@booking_form.row.last(2).first.find_elements(css: 'div')[1].text).to eql @surname
  end
end
