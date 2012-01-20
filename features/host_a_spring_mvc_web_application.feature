Feature:Host a spring mvc web application

Scenario: Request routing
Given I host a spring mvc application with context location of "WEB-INF/mvc-dispatcher-servlet.xml"
And the application will respond to get requests for the uri "/hello" 
And I GET "/hello"
Then I recieve an HTTPResponse with a 200 code
