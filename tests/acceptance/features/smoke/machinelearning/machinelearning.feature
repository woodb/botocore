# language: en
@machinelearning
Feature: Amazon Machine Learning

  I want to use Amazon Machine Learning

  Scenario: Making a request
    When I call the "DescribeMLModels" API
    Then the value at "Results" should be a list

  Scenario: Error handling
    When I attempt to call the "GetBatchPrediction" API with:
    | BatchPredictionId | fake-id |
    Then I expect the response error code to be "ResourceNotFoundException"
    And I expect the response error message to include:
    """
    No BatchPrediction with id fake-id exists
    """
