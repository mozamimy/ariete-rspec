require 'spec_helper'
require 'ariete'

describe Ariete::Rspec do
  def output
    puts "Ariete is a kind of rabbit."
    warn "Ariete means 'Lop' in Italian."
  end

  it 'has a version number' do
    expect(Ariete::Rspec::VERSION).not_to be nil
  end

  describe "custom matchers" do
    describe "#be_output" do
      subject { method(:output).to_proc }
      it { is_expected.to be_output "Ariete is a kind of rabbit.\n" }
    end

    describe "#be_output_to_stderr" do
      subject { method(:output).to_proc }
      it { is_expected.to be_output_to_stderr "Ariete means 'Lop' in Italian.\n" }
    end
  end
end
