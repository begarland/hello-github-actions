require "selenium-webdriver"

When ('I am testing') do

    login = "test"
    chromeOptions = Selenium::WebDriver::Chrome::Options.new
    chromeOptions.add_argument("--no-sandbox") 
    chromeOptions.add_argument("--disable-setuid-sandbox") 
    
    chromeOptions.add_argument("--remote-debugging-port=9222")  # this
    
    chromeOptions.add_argument("--disable-dev-shm-using") 
    chromeOptions.add_argument("--disable-extensions") 
    chromeOptions.add_argument("--disable-gpu") 
    chromeOptions.add_argument("start-maximized") 
    chromeOptions.add_argument("disable-infobars") 
    chromeOptions.add_argument("--headless") 
    chromeOptions.add_argument(r"user-data-dir=.\cookies\\" + login) 
    b = webdriver.Options(chrome_options=chromeOptions) 
    b.get("https://google.com/") 
    b.quit()

    log('testing')
    true
end

