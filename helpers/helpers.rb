# used to make element wait for certain amount of time
# @example
#   wait(3).until { @driver.find_element(id: 'layer_cart').displayed? }
def wait(seconds)
  Selenium::WebDriver::Wait.new(timeout: seconds)
end

# used to mouse over a certain element
# @example
#   mouse_over_element(@driver.find_element(class: 'first-item-of-mobile-line'))
def mouse_over_element(element)
  @driver.action.move_to(element).perform
end

# generate a random string
# @example
#   string = random_string(10)
#  @return [String] String
def random_string(n)
  [*('a'..'z'), *('A'..'Z'), *('0'..'9')].sample(n).join
end

# This is used to wait for element to load
# this is run behind using java script
# @example
#   browser.wait_for_ajax return window.jQuery != undefined
def wait_for_ajax(timeout: 20)
  wait(timeout).until do
    @driver.execute_script('return jQuery.active == 0')
    sleep 1
  end
rescue
  'wait_for_ajax: jQuery not active'
end

# page refresh
def page_refresh
  @driver.navigate.refresh
end
