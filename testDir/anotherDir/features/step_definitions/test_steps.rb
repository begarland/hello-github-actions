require "selenium-webdriver"

When ('I am testing') do
    browser = Selenium::WebDriver.for:chrome
    browser.add_argument('--disable-extensions')
    browser.add_argument('--headless')
    browser.add_argument('--disable-gpu')
    browser.add_argument('--no-sandbox')
    browser.get('http://www.google.com')
    log('testing')
    true
end

