require "selenium-webdriver"
require 'watir'


When ('I am testing') do

    login = "test"
    chromeOptions = Selenium::WebDriver::Chrome::Options.new
    chromeOptions.add_argument("--no-sandbox") 
    
    # chromeOptions.add_argument("--remote-debugging-port=9222")  # this
    
    # chromeOptions.add_argument("--disable-dev-shm-using") 
    chromeOptions.add_argument("--headless") 

    b = Selenium::WebDriver.for(:chrome, options: chromeOptions)
    b.get("https://google.com/") 
    b.quit()

    log('testing')
    true
end

