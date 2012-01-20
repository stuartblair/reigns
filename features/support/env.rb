$LOAD_PATH.unshift(File.expand_path('../../../lib', __FILE__))
$LOAD_PATH.unshift(File.expand_path('../../../reference_apps', __FILE__))
require 'java'
require 'classpath'
require 'reigns'
java_import 'com._5values.dummy.controller.HelloController'
