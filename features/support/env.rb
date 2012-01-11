require 'java'
$CLASSPATH << File.join(File.dirname(__FILE__), 'reference_apps', 'valid_app', 'target', 'valid_app', 'WEB-INF', 'classes')
Dir.glob("**/lib/*.jar") {|jar| $CLASSPATH << jar}

java_import 'com._5values.dummy.controller.HelloController'
