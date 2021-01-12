require "selenium-webdriver"
require 'watir'


When ('I am testing') do

    login = "test"
    chromeOptions = Selenium::WebDriver::Chrome::Options.new
    chromeOptions.add_argument("--no-sandbox") 
 
    chromeOptions.add_argument("--headless") 

   

    Watir::Browser.new browser.to_sym,
                       switches: ['--ignore-certificate-errors'],
                       headless: ENV['CI'].present?
    b.goto("https://google.com/") 
    b.quit()

    log('testing')
    true
end

