Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario: get all users
    Given path 'user/all'
    When method get
    Then status 200


  Scenario: create a user
    * def user =
      """
      {
        "email": "test@user.com",
        "name": "Test User"
        }
      }
      """

    Given url 'https://jsonplaceholder.typicode.com/users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

    Given path id
    # When method get
    # Then status 200
    # And match response contains user
  