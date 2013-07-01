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
    },
    {
      "path" : "/procurement/fpdsng/{agencyid}/productorservicecodes",
      "operations" : [
        {
          "httpMethod" : "GET",
          "parameters" : [
            {
              "paramType" : "path",
              "allowMultiple" : false,
              "description" : "The agencyid",
              "required" : true,
              "dataType" : "string",
              "name" : "agencyid"
            }
          ],
          "responseClass" : "string",
          "errorResponses" : [
          
            {
              "reason" : "Unauthorized",
              "code" : 401
            }

          ],
          "nickname" : "productorservicecodes",
          "summary" : "Get a list of product or service codes for a given agency id"
        }
      ],
      "description" : "Get a list of product or service codes for a given agency id"
    }
  ]
}
      """
    When calling '@object.agencyids' 
    Then the response should contain "COMPTROLLER GENERAL OF THE UNITED STATES"

    When calling '@object.productorservicecodes("0010")'
    Then the response should contain "SURGICAL INSTRUMENTS"

  Scenario: Provide info
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
    },
    {
      "path" : "/procurement/fpdsng/{agencyid}/productorservicecodes",
      "operations" : [
        {
          "httpMethod" : "GET",
          "parameters" : [
            {
              "paramType" : "path",
              "allowMultiple" : false,
              "description" : "The agencyid",
              "required" : true,
              "dataType" : "string",
              "name" : "agencyid"
            }
          ],
          "responseClass" : "string",
          "errorResponses" : [
          
            {
              "reason" : "Unauthorized",
              "code" : 401
            }

          ],
          "nickname" : "productorservicecodes",
          "summary" : "Get a list of product or service codes for a given agency id"
        }
      ],
      "description" : "Get a list of product or service codes for a given agency id"
    }
  ]
  }
  """

  When calling '@object.get_info("agencyids")' 
  Then the response should be:
  """
  Get a list of agency ids and their description based upon the available fpds-ng data      
  """
  When calling '@object.get_apidesc("agencyids")' 
  Then the response should be:
  """
  Get a list of agency ids
  """

  When calling '@object.get_apidesc("productorservicecodes")'
  Then the response should be:
  """
  Get a list of product or service codes for a given agency id
  """
    


    
