require 'pry'

class Owner
  attr_accessor :pets
  attr_reader :species, :name
  
  @@owners = []
  @@pets = {:cats => [], :dogs => []}
  
  def initialize(name)
    @species = "human"
    @name = name
    @@owners << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@owners
  end
  
  def self.count
    @@owners.length
  end
  
  def self.reset_all
    @@owners.clear
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name_of_cat)
    @@pets << Cat.new(name_of_cat, self)
  end
  
  def buy_dog(name_of_dog)
    Dog.all << Dog.new(name_of_dog, self)
  end
  
  def sell_pets
    @@pets.select do |pets| 
      @@pets.mood = "nervous"
    end
    self.reset_all
  end
  
  def feed_cats
    @@pets.collect do |species, feeding|
      if species == Cat.all
        feeding.each do |cat|
          cat.mood = "happy"
        end
      end
    end
  end
  
  def walk_dogs
    @@pets.collect do |species, walks|
      if species == Dog.all
        walks.each do |dog|
          dog.mood = "happy"
        end
      end
    end
  end 


  def list_pets
    num_dogs = Dog.all.count
    num_cats = Cat.all.count
    return "I have #{num_dogs} dog(s) and #{num_cats} cat(s)."
  end
  
end