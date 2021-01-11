require "selenium-webdriver"

When ('I am testing') do
    browser = Selenium::WebDriver.for:chrome
    browser.get('http://www.google.com')
    log('testing')
    true
end

