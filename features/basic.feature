Feature: API

  Scenario: Instantiate object
    Given a valid api_key is configured
    When I create SwaggerResource '@object' from json:
      """
{
  "basePath" : "http://api.fedapi.com/v1",
  "NewKey" : "String",
  "swaggerVersion" : "1.1",
  "apis" : [
    {
      "path" : "/procurement/fpdsng/agencyids",
      "operations" : [
        {
          "httpMethod" : "GET",
          "responseClass" : "string",
          "errorResponses" : [
            
            {
              "reason" : "Unauthorized",
              "code" : 401
            }

          ],
          "nickname" : "agencyids",
          "summary" : "Get a list of agency ids and their description based upon the available fpds-ng data"
        }
      ],
      "description" : "Get a list of agency ids"
    }
  ]
}
      """
    When calling '@object.agencyids' 
    Then the response should contain "COMPTROLLER GENERAL OF THE UNITED STATES"

