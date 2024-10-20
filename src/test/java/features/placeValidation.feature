Feature: Validating Place API's
@AddPlace @Regression
Scenario Outline: Verify if Place is being Succesfully added using AddPlaceAPI
	Given Add Place Payload with "<name>"  "<language>" "<address>"
	When user calls "AddPlaceAPI" with "POST" http request
	Then the API call got success with status code 200
	And "status" in response body is "OK"
	And "scope" in response body is "APP"
	And verify place_Id created maps to "<name>" using "getPlaceAPI"
	
Examples:
	|name 	 | language |address		   |
	|AAhouse |  English |World cross center|
#	|BBhouse | Spanish  |Sea cross center  |

@updatePlace @Regression
Scenario Outline: Verify if Update Place functionality is working
	Given UpdatePlace Payload with "<New_Address>"
	When user calls "updatePlaceAPI" with "PUT" http request
	Then the API call got success with status code 200
	And verify address updated maps to "<New_Address>" using "getPlaceAPI"

Examples:
|New_Address|
|Pune , Wakad |


@DeletePlace @Regression @ignore
Scenario: Verify if Delete Place functionality is working

  Given DeletePlace Payload
	When user calls "deletePlaceAPI" with "POST" http request
	Then the API call got success with status code 200
	And "status" in response body is "OK"
