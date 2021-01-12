require "selenium-webdriver"

When ('I am testing') do
    browser = Selenium::WebDriver.for:chrome
    browser.add_argument('--headless')
    browser.get('http://www.google.com')
    log('testing')
    true
end

