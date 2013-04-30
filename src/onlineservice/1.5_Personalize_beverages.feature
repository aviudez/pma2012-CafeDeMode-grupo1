Feature: Personalize beverages
  As a customer
  In order to have a nice experience and do not suffer any undesirable effect
  I want to be able to personalize my beverages

  Background: 
    Given the customer''s order is not empty

  Scenario Outline: Coffee beverages can be personalized
    Given the customer''s order contains a coffee beverage
    When the customer personalize the selected coffee beverage with "<extra>"
    Then the customer''s order contains a coffee beverage with  "<extra>"

    Examples: 
      | extra         |
      | doble dose    |
      | decaffeinated |

  Scenario Outline: Milk beverages can be personalized
    Given the customer''s order contains a milk beverage
    When the customer change  the type of milk from "<old_milk>" to  "<new_milk>" for the selected milk beverage
    And the customer personalize the selected milk beverage with "<extra>"
    Then the customer''s order contains a milk beverage with  "<new_milk>" milk and "<extra>"

    Examples: 
      | old_milk | new_milk | extra                 |
      | dairy    | dairy    | skim                  |
      | dairy    | dairy    | lactose-free          |
      | dairy    | soya     | skim and lactose-free |
