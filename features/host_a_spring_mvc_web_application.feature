Feature:Host a spring mvc web application

Scenario Outline: Request routing
Given I host a spring mvc application with context location of "WEB-INF/mvc-dispatcher-servlet.xml"
And the application will respond to <Operation> requests for the uri <URI>
When I <Operation> <URI>
Then I receive a HTTPResponse with a <Code> code

Examples:
| Operation | URI    | Code |
| GET       | /hello | 200  |
| PUT       | /hello | 200  |
| POST      | /hello | 200  |
| DELETE    | /hello | 200  |

Scenario: Content is routed from requests through controllers to responses
Given I host a spring mvc application with context location of "WEB-INF/mvc-dispatcher-servlet.xml"
When I POST a body to /person/echo containing JSON data: {"name":"Jack Jarvis","address":"15 Osprey Heights"}
Then I receive a response containing JSON data: {"name":"Jack Jarvis","address":"15 Osprey Heights"}

Scenario: Provide access to spring beans
Given I host a spring mvc application with context location of "WEB-INF/mvc-dispatcher-servlet.xml"
And the application contains a spring bean with the id "helloController" 
When I request the bean "helloController"
Then I receive a non-nil object from my application context
