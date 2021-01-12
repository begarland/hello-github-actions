require "selenium-webdriver"
require 'watir'


When ('I am testing') do

    b = Watir::Browser.new :chrome, headless: true, 'no-sandbox': true, switches: ['--ignore-certificate-errors']

    b.goto("https://google.com/") 
    b.quit()

    log('testing')
    true
end

