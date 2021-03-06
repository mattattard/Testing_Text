
  Feature: Payment Processing Function:
    In order to process payment
    As someone who is wanting to pay
    I want to be able to process payment securely.

    Scenario:  All details entered correctly:
      Given     I am a user trying to process a payment
      When      I submit correct details
      Then      I should be told that the payment was successful


    Scenario Outline:  When a field is left empty :
      Given     I am a user trying to process a payment
      When      I submit a form with all data except "<fieldName>"
      Then      I should be told that "<fieldName>" is required

      Examples:
        | fieldName     |
        | name      |
        | address   |
        | card      |
        | expiry    |
        | cvv       |
        | amount    |



    Scenario: Entering details incorrect
      Given I am a user trying to process a payment
      When  I submit a form with any invalid that which the processing system rejects
      Then  I should be told that there was an error processing my transaction


    Scenario Outline: Entering values according to the card type:
     Given I am a user trying to process a payment
     When I submit correct details using a "<card-type>" card
     Then I should be told that the payment was successful


     Examples:
      | card-type |
      | American Express |
      | Master Card |
      | Visa |

    Scenario: Clear the form
      Given I am a user trying to process a payment
      When  I fill in the form
      And   Click on the clear button
      Then  The form data should be cleared

