require 'rspec'
require 'ariete'
require 'ariete/rspec/version'

RSpec::Matchers.define :be_output do |expect|
  match do |actual|
    Ariete.capture_stdout { actual.call } == expect.to_s
  end
end

RSpec::Matchers.define :be_output_to_stderr do |expect|
  match do |actual|
    Ariete.capture_stderr { actual.call } == expect.to_s
  end
end
