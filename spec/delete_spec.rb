describe 'Test 2: Delete Booking' do
  it 'Delete booking' do
    # Open App
    @driver.get 'http://hotel-test.equalexperts.io/'
    # Add booking
    @booking_form.add_booking('test', 'delete', '123.99', 'true', '2018-09-24', '2018-09-25')
    # Get Last record id
    record_id = @booking_form.row.last(2).first.attribute("id")
    @booking_form.delete_booking(record_id)

    # Expect record to have been deleted
    expect(@driver.find_elements(class: 'row').last(2).first.attribute("id")) != record_id
  end
end
