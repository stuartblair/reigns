Feature:Host a spring mvc web application

Scenario: Request routing
Given I have a spring mvc application context location of "application-servlet.xml"
And the application will respond to get requests for the uri "/hello" 
When I host the application
And I GET "/hello"
Then I recieve an HTTPResponse with a 200 code

Scenario: Invalid application context
Given I have a spring mvc application context location of ""
When I host the application
Then I receive an error message reporting that "" is an invalid application context

Scenario: Missing the supporting spring mvc classes from the runtime environment
Given I have a spring mvc application context location of "application-servlet.xml"
And the application will respond to get requests for the uri "/hello"
But I don't have Spring MVC's supporting classes on my classpath
When I host the application
Then I receive an error message reporting the classes that cannot be found