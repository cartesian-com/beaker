if RUBY_VERSION < "1.9"
  require 'test/unit/assertions'
else
  require 'minitest/autorun'
end

module Beaker
  module CommandFactory
    if defined?(Test::Unit::Assertions)
      include Test::Unit::Assertions
    else
      include Minitest::Assertions
    end

    def execute(command, options={}, &block)
      result = self.exec(Command.new(command), options)

      if block_given?
        yield result
      else
        result.stdout.chomp
      end
    end

    def fail_test(msg)
      assert(false, msg)
    end
  end
end
