$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'pathname'
require 'tmpdir'

home_dir = Pathname.new(Dir.pwd)
spec_dir = home_dir + 'spec'

FIXTURE_PATH = spec_dir + 'fixtures/'

Dir.glob(spec_dir + 'support/**/*.rb') { |file| require file }

require 'godville_kit/initialize'

def fixture_file(file)
  Pathname.new(FIXTURE_PATH + file)
end

def fixture_contents(file)
  File.open(fixture_file(file), 'r').read
end
