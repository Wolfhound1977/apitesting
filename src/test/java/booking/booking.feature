Feature: booking testing
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario: create a booking for a non existing user
    * def booking =
      """
      {
        "date": "2020-01-01",
        "destination": "NYC",
        "id": "testuser",
        "origin": "MAD"
      }
      """
    Given url 'http://127.0.0.1:8900/booking'
    And request booking
    When method post
    Then status 500

  Scenario: create a booking for existing user
    * def booking =
      """
      {
        "date": "2020-01-08",
        "destination": "BER",
        "id": "pepe@pepe.pe1-0.1",
        "origin": "MAD"
      }
      """

    Given url 'http://127.0.0.1:8900/booking'
    And request booking
    When method post
    Then status 201
    

  Scenario: get booking for existing user
    Given url 'http://127.0.0.1:8900/booking?id=pepe%40pepe.pe1-0.1'
    When method get
    Then status 200

  Scenario: Wrong id for user
    Given url 'http://127.0.0.1:8900/booking?id=tttttttt'
    When method get
    Then status 200

  Scenario: create wrong booking IATA codes
    * def booking =
      """
      {
        "date": "2020-01-08",
        "destination": "string",
        "id": "pepe@pepe.pe1-0.1",
        "origin": "string"
      }
      """

    Given url 'http://127.0.0.1:8900/booking'
    And request booking
    When method post
    Then status 409

    * def id = response.id
    * print 'error is: ', id
