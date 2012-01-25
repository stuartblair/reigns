Feature:Host a spring mvc web application

Scenario: Request routing
Given I host a spring mvc application with context location of "WEB-INF/mvc-dispatcher-servlet.xml"
And the application will respond to get requests for the uri "/hello" 
And I GET "/hello"
Then I recieve an HTTPResponse with a 200 code

Scenario: Provide access to spring beans
Given I host a spring mvc application with context location of "WEB-INF/mvc-dispatcher-servlet.xml"
And the application contains a spring bean with the id "helloController" 
And I request the bean "helloController"
Then I recieve a non-nil object from my application context
