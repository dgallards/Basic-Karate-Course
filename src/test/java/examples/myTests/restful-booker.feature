@restful
Feature: API test using RESTfulBooker application

Background:
  Given url 'https://restful-booker.herokuapp.com'

Scenario:
  # obtain token
  Given path 'auth'
  And request { username: 'admin', password: 'password123' }
  When method post
  Then status 200
  And def authToken = response.token

  And def booking =
  """
  {
    "firstname": "Anthony", "lastname": "ODonnell",
    "totalprice": 500, "depositpaid": true,
    "additionalneeds": "Clearly Defined Requirements",
    "bookingdates": { "checkin": "2022-08-30", "checkout": "2022-09-10" }
  }
  """

  # create booking
  Given path 'booking'
  And header Accept = 'application/json'
  And request booking
  When method post
  Then status 200
  And match response contains { bookingid: '#number', booking: '#(booking)' }
  And def bookingid = response.bookingid

  # find booking by name
  Given path 'booking'
  And param firstname = booking.firstname
  And param lastname = booking.lastname
  When method get
  Then status 200
  And match response contains { bookingid: '#(bookingid)' }
  And def toDelete = response

  # find booking by date
  Given path 'booking'
  And param checkin = '2022-07-01'
  And param checkout = booking.bookingdates.checkout
  When method get
  Then status 200
  And match response contains { bookingid: '#(bookingid)' }

  # update booking
  * booking.totalprice = 0
  Given path 'booking', bookingid
  And header Accept = 'application/json'
  And header Cookie = 'token=' + authToken
  And request booking
  When method put
  Then status 200
  And match response contains booking

  # partially update booking
  * booking.totalprice = 1000
  Given path 'booking', bookingid
  And header Accept = 'application/json'
  And header Cookie = 'token=' + authToken
  And request { totalprice: 1000 }
  When method patch
  Then status 200
  And match response contains booking

  # delete bookings
  * call read('@delete') toDelete

@ignore @delete
Scenario:
  Given path 'booking', bookingid
  And header Cookie = 'token=' + authToken
  When method delete
  Then status 201
