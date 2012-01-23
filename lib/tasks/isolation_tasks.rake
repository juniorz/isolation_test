## This is required until the regular test task
## below passes.  It's not ideal, but at least
## we can see the failures
namespace :isolation do
  task :test do
    dir = ENV["TEST_DIR"] || "**"
    Dir["test/#{dir}/*_test.rb"].each do |file|
      next true if file.include?("fixtures")
      dash_i = [
        'test',
        # 'lib',
        # "#{File.dirname(__FILE__)}/../activesupport/lib",
        # "#{File.dirname(__FILE__)}/../actionpack/lib"
      ]
      ruby "-I#{dash_i.join ':'}", file
    end
  end
end
