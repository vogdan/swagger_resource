Feature: API

  Scenario: Instantiate object
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
    Then the JSON response should be:
      """
      [{"tweet":"Hello World!"},{"tweet":"New Rails has been released"}]
      """



  Scenario: Object info
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
    When calling '@object.get_info("agencyids")' 
    Then the response should be:
      """
      Get a list of agency ids and their description based upon the available fpds-ng data      
      """
    


    


    
