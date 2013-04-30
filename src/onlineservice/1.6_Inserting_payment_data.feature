Feature: Inserting payment data
  As a "Cafe deMode" owner
  In order to be able to charge
  I want to be able to get customer payment data

  Background: 
    Given the order is not empty

  Scenario Outline: Correct Data Insertion
    Given Data on <card_number>, <card_holder_name> and <CVC> is correct
    When user confirms payment
    Then user will be able to pay

    Examples: 
      | card_number         | card_holder_name        | CVC |
      | 1234-1234-4765-4534 | Pedro Martinez Perez    | 345 |
      | 5343-4543-6456-1275 | Laura Fernandez Sanchez | 874 |
      | 2344-7889-2345-3224 | Mike Allen              | 435 |

  Scenario Outline: Incorrect or Empty Data
    Given Data on <numero_tajerta>, <card_holder_name> or <CVC> is incorrect or empty
    When user confirms payment
    Then message "Incorrect Data" is shown
    And user will not be able to pay

    Examples: 
      | car_number          | card_holder_name        | CVC |
      |                     | Pedro Martinez Perez    | 345 |
      | 1234-1234-4765-4534 |                         | 345 |
      | 1234-1234-4765-4534 | Pedro Martinez Perez    |     |
      | 5343-4543-6456-12   | Laura Fernandez Sanchez | 874 |
      | 5343-4543-6456-ABCD | Laura Fernandez Sanchez | 874 |
      | 5343-4543-6456-1275 | Laura Fernandez Sanchez | 87  |
      | 5343-4543-6456-1275 | Laura Fernandez Sanchez | 87A |

  Scenario: User decides not to confirm payment
    When User selects to return to order / select not to confirm payment
    Then User will see order page
    And User will see current order
