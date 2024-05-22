Feature: sample karate test script
    for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: get all posts and then get the post  id
    Given path 'posts'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'posts', first.id
    When method get
    Then status 200

  Scenario: create a post and then get it by id
    * def user =
      """
      {
        "userId": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      }
      """

    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

  