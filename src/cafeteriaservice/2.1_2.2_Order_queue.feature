Feature: Order Queue
  As Cafe deMode owners's
  In order to customers wait the minimum time
  I want to sort the orders by collection expected time

  Background: 
    Given "Cafe deMode" is located in number "4", "Diagonal Avenue"
	And "Peter" made an order at "9:02am"
    And "Tom" made an order at "9:10am"
    And There are no more requests in progress 
    
  Scenario: Two orders, one near bar and the other very far
    Given The "Peter" order is made from number "4", "Diagonal Avenue"
    And The "Tom" order is made from number "100", "Diagonal Avenue"
    When The owner take a look to the orders queue	
    Then The owners see the orders prioritized list
    And the orders list is "Peter, Tom"

  Scenario: Two orders from the same location
    Given The "Peter" order is made from number "100", "Diagonal Avenue"
    And The "Tom" order is made from number "100", "Diagonal Avenue"
    When The owner take a look to the orders queue	
    Then The owners see the orders prioritized list
    And the orders list is "Peter, Tom"

  Scenario: Two orders, one of the orders made in the shop
    Given The "Peter" order is made from number "100", "Diagonal Avenue"
    And The "Tom" order is made in "Cafe deMode"
    When The owner take a look to the orders queue	
    Then The owners see the orders prioritized list
    And the orders list is "Tom, Peter"
    
  Scenario: Two orders, the shopkeeper reported that one of the customers is in the shop
    Given The "Peter" order is made from number "3", "Diagonal Avenue"
    And The "Tom" order is made from number "100", "Diagonal Avenue"
    And the orders list is in the state "Peter, Tom"
    And The shopkeeper reported that "Tom" is in the shop
    When The owner take a look to the orders queue	
    Then The owners see the orders prioritized list
    And the orders list is "Tom, Peter"
  
  Scenario Two orders, the customers are in the shop
  	Given The "Peter" order is made from number "3", "Diagonal Avenue"
    And The "Tom" order is made from number "100", "Diagonal Avenue"
    And "Tom" arrives at the shop at "9:15am"
    And "Peter" arrives at the shop at "9:20am"
    When The owner take a look to the orders queue	
    Then The owners see the orders prioritized list
    And the orders list is "Tom, Peter"
    
    