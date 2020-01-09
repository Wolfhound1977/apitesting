Feature: suser testing
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario: get all users
    Given path 'user/all'
    When method get
    Then status 200

  Scenario: get wrong user id
    Given url 'http://127.0.0.1:8900/user?id=ttttttt'
    When method get
    Then status 404

    * def error = response.id
    * print 'error is: ', error



  Scenario: create a user
    * def user =
      """
      {
        "email": "test@test.com",
        "name": "test user"
      }
      """

    Given url 'http://127.0.0.1:8900/user'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

    * def booking =
      """
      {
        "date": "2020-01-08",
        "destination": "BER",
        "id": #(id),
        "origin": "MAD"
      }
      """

    Given url 'http://127.0.0.1:8900/booking'
    And request booking
    When method post
    Then status 201


