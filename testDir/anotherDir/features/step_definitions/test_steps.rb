require "selenium-webdriver"
require 'watir'


When ('I am testing') do

    b = Watir::Browser.new 'chrome'.to_sym,
                       switches: ['--ignore-certificate-errors'],
                       headless: ENV['CI'].present?
    b.goto("https://google.com/") 
    b.quit()

    log('testing')
    true
end

