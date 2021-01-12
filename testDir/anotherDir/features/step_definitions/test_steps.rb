require "selenium-webdriver"
require 'watir'


When ('I am testing') do

    b = Watir::Browser.new :chrome, headless: true, switches: ['--ignore-certificate-errors', '--no-sandbox']

    b.goto("https://google.com/") 
    b.quit()

    log('testing')
    true
end



# need to pass --no-sandbox flag and make sure headless IS being passed in the other environment

# next steps, clean up chrome download to remove unnecessary parts


