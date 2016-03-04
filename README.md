# ariete-rspec

An extension of Ariete for RSpec.
You can test standard output with RSpec custom matchers, eg. `be_output`, `be_output_to_stderr`.

## Requirement

- Ruby 2.0 or hight
- RSpec 3

## Installation

```
$ (sudo) gem install 'ariete-rspec'
```

## Usage

### klass.rb

```ruby
class Klass
  class << self
    def output_out
      puts "Ariete is a kind of rabbit."
    end

    def output_err
      warn "Ariete means 'Lop' in Italian."
    end
  end
end
```

### klass_spec.rb

```ruby
require "ariete-rspec"
require_relative "klass"

RSpec.describe Klass do
  # Ariete extends matchers of RSpec.
  # Therefore, you can use 'be_output' and 'be_output_to_stderr'.
  describe ".output_out" do
    subject { Klass.method(:output_out).to_proc }
    it { is_expected.to be_output "Ariete is a kind of rabbit.\n" }
  end

  describe ".output_out (an alternate expression)" do
    subject { -> { Klass.output_out } }
    it { is_expected.to be_output "Ariete is a kind of rabbit.\n" }
  end

  describe ".output_err" do
    subject { Klass.method(:output_err).to_proc }
    it { is_expected.to be_output_to_stderr "Ariete means 'Lop' in Italian.\n" }
  end

  describe ".output_err (an alternate expression)" do
    subject { -> { Klass.output_err } }
    it { is_expected.to be_output_to_stderr "Ariete means 'Lop' in Italian.\n" }
  end
end
```

## License

MIT License

## Contributing

1. Fork it ( https://github.com/mozamimy/ariete-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
