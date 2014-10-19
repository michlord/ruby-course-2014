require 'test/unit'

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

all_tests = Dir[File.dirname(__FILE__) + '/unit/*_spec.rb']
all_tests.each do |test|
  require 'unit/' + File.basename(test)
end

