Feature: browser automation 1

  Background:
    * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
    * def randomString = function() { return "test"+String( Math.floor(Math.random() * 99999)+100000)}

  Scenario: try to sign up to demoblaze.com

    Given driver 'https://www.demoblaze.com/'
    And submit().click("a[id=signin2]")
    * def username = randomString()
    * def pwd = randomString()
    And input('#sign-username', username ,200)
    And input('#sign-password', pwd ,200)
    When click("//div[@id='signInModal']//button[@class='btn btn-primary']")
    * delay(3000)
    Then match driver.dialogText == 'Sign up successful.'
    * delay(3000)
    * dialog(true)

    Given driver 'https://www.demoblaze.com/'
    And click("a[id=login2]")
    And input("//input[@id='loginusername']", username ,200)
    And input("//input[@id='loginpassword']", pwd ,200)
    When click("//div[@id='logInModal']//button[@class='btn btn-primary']")
    * delay(3000)
    Then match text("a[id=nameofuser]") == 'Welcome '+ username
    * delay(3000)



  