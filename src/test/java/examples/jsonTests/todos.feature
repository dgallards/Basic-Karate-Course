Feature: sample karate test script
    for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: get all todos and then get the first todo by id
    Given path 'todos'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'todos', first.id
    When method get
    Then status 200


  