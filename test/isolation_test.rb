require 'isolation/abstract_unit'

class IsolationTest < ActiveSupport::TestCase
  include ActiveSupport::Testing::Isolation

  def setup
    build_app
    boot_rails
  end

  def teardown
    teardown_app
  end

end
