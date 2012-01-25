Feature:Host a spring mvc web application

Scenario Outline: Request routing
Given I host a spring mvc application with context location of "WEB-INF/mvc-dispatcher-servlet.xml"
And the application will respond to <Operation> requests for the uri <URI>
And I <Operation> <URI>
Then I recieve an HTTPResponse with a <Code> code

Examples:
| Operation | URI    | Code |
| GET       | /hello | 200  |
| PUT       | /hello | 200  |
| POST      | /hello | 200  |
| DELETE    | /hello | 200  |


Scenario: Provide access to spring beans
Given I host a spring mvc application with context location of "WEB-INF/mvc-dispatcher-servlet.xml"
And the application contains a spring bean with the id "helloController" 
And I request the bean "helloController"
Then I receive a non-nil object from my application context
