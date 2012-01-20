$CLASSPATH << File.join(File.dirname(__FILE__), 'valid_app', 'target', 'valid_app')
$CLASSPATH << File.join(File.dirname(__FILE__), 'valid_app', 'target', 'valid_app', 'WEB-INF', 'classes')
Dir.glob("**/lib/*.jar") {|jar| $CLASSPATH << jar}
