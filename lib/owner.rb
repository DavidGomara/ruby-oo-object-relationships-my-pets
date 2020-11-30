class Owner
    
    attr_reader :name, :species
    
    @@all = []
    
    def initialize(name)
        @species = "human"
        @@all << self
        @name = name
    end 
    
    def say_species
        "I am a #{@species}."
    end 
    
    def self.all
        @@all
    end 
    
    def self.count
        all.count
    end 
    
    def self.reset_all
        @@all = []
    end 
    
    def cats
        Cat.all.select { |cat| cat.owner == self}
    end 
    
    def dogs 
        Dog.all.select { |dog| dog.owner == self}
    end 
    
    def feed_cats
        Cat.all.select { |cat| cat.owner == self}.each { |cat| cat.mood = "happy" }
    end 
    
    def walk_dogs 
        Dog.all.select { |dog| dog.owner == self}.each { |dog| dog.mood = "happy" }
    end 
    
    def sell_pets
        pets = self.dogs + self.cats
        pets.each { |pets| pets.owner = nil }
        pets.each { |pets| pets.mood = "nervous" }
    end 
    
    def buy_cat(cat)
        cat = Cat.new(cat, self)
    end 
    
    def buy_dog(dog)
        dog = Dog.new(dog, self)
    end 
    
    def list_pets
        "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end 
    
end