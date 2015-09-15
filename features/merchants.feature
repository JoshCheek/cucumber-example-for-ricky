Feature: Merchants can use the site

  As a merchant,
  I want to view my items
  so that I can remove outdated items,
  order things that are low in stock

  Scenario: Viewing my items
    Given I'm merchant 4 with the items
      | name     | stock |
      | banana   | 200   |
      | cup cake | 150   |
    When I request: GET /api/v1/merchants/4/items
    Then the response has status: 200, type: application/json
    And the response has a body of JSON hashes matching:
    """
    {"name": "banana",   "stock": 200}
    {"name": "cup cake", "stock": 150}
    """
