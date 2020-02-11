require 'pry'

class Cat
  
  attr_reader :name
  attr_accessor :mood, :owner
  
  @@cats = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@cats << self
  end

  def self.all
    @@cats
  end
  
end