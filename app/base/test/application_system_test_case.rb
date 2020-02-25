require 'test_helper'
require 'selenium/webdriver'
require 'capybara/rails'

Capybara.server_host = '0.0.0.0'
Capybara.server_port = '3000'
Capybara.server = [:puma, Silent: true]

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase

  driven_by(
    :selenium,
    using: :headless_chrome,
    screen_size: [1400, 1400],
    options: { url: 'http://hub:4444/wd/hub' }
  )

  setup do
    ip = Socket.ip_address_list.select(&:ipv4?).last.ip_address
    host! "http://#{ip}:3000"
  end

end
