require "selenium-webdriver"
require 'watir'


When ('I am testing') do

    # login = "test"
    # chromeOptions = Selenium::WebDriver::Chrome::Options.new
    # chromeOptions.add_argument("--no-sandbox") 
    # chromeOptions.add_argument("--disable-setuid-sandbox") 
    
    # chromeOptions.add_argument("--remote-debugging-port=9222")  # this
    
    # chromeOptions.add_argument("--disable-dev-shm-using") 
    # chromeOptions.add_argument("--disable-extensions") 
    # chromeOptions.add_argument("--disable-gpu") 
    # chromeOptions.add_argument("start-maximized") 
    # chromeOptions.add_argument("disable-infobars") 
    # chromeOptions.add_argument("--headless") 
    # chromeOptions.add_argument("user-data-dir=.\cookies\\" + login) 
    # b = Selenium::WebDriver.for(:chrome, options: chromeOptions)
    # b.manage.timeouts.page_load = 120
    # b.get("https://google.com/") 
    # b.quit()

    caps = Selenium::WebDriver::Remote::Capabilities.chrome          
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 600 
    client.open_timeout = 600 
    driver =  Watir::Browser.new :chrome, :desired_capabilities => caps, 
                                 :http_client => client
    driver.goto("https://google.com/") 

    log('testing')
    true
end

