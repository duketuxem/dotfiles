require "gem"

string = "base16"
symbol = :base16
fixnum = 0
float  = 0.00
array  = Array.new
array  = ['chris', 85]
hash   = {"test" => "test"}
regexp = /[abc]/
40m

class Person
  attr_accessor :name

  def initialize(attributes = {})
    @name = attributes[:name]
  end

  def self.greet
    "hello"
  end
end
