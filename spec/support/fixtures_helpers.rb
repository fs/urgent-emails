module FixturesHelpers
  def fixture_path(path)
    File.join(app_config.root, 'spec/support/fixtures', path)
  end
end

module MiniTest
  class Spec
    include FixturesHelpers
  end
end
