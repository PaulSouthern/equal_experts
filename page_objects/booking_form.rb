class BookingForm

  def initialize(driver)
    @driver = driver
  end

  def row
    @driver.find_elements(class: 'row')
  end

  def add_booking(first_name, surname, price, deposit, check_in, check_out)
    # Get last record id
    record_id = @driver.find_elements(class: 'row').last(2).first.attribute("id")
    @driver.find_element(id: 'firstname').send_keys(first_name)
    @driver.find_element(id: 'lastname').send_keys(surname)
    @driver.find_element(id: 'totalprice').send_keys(price)
    # Select deposit dropdown value
    dl = @driver.find_element(id: 'depositpaid')
    options = dl.find_elements(tag_name: 'option')
    options.each { |option| option.click if option.text == deposit }
    @driver.find_element(id: 'checkin').send_keys(check_in)
    @driver.find_element(id: 'checkout').send_keys(check_out)
    @driver.find_element(css: 'input[value=" Save "]').click
    # Wait until record added
    wait(3).until { @driver.find_elements(class: 'row').last(2).first.attribute("id") != record_id }
    page_refresh
    wait_for_ajax
  end

  def delete_booking(id)
    booking_id = "deleteBooking(#{id})"
    @driver.find_element(css: "input[onclick='#{booking_id}']").click
  end
end

class Login

  LOGIN_BUTTON = { class: 'login' }
  EMAIL_INPUT = { id: 'email' }
  PASSWORD_INPUT = { id: 'passwd' }
  SUBMIT_BUTTON = { id: 'SubmitLogin' }

  def initialize(driver)
    @driver = driver
    @driver.get 'http://automationpractice.com'
  end

  def with(username, password)
    # Sign In
    @driver.find_element(LOGIN_BUTTON).click
    @driver.find_element(EMAIL_INPUT).send_keys(username)
    @driver.find_element(PASSWORD_INPUT).send_keys(password)
    @driver.find_element(SUBMIT_BUTTON).click
  end
end

