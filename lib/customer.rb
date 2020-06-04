class Customer
  attr_accessor :name, :age #each customer instance has a name & an age

  @@all = [] 

  def initialize(name, age)
    @name = name 
    @age = age 
    @@all << self
  end

  def self.all 
    @@all 
  end 

  #we need to give the customer the ability to create a meal 
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter,self,total,tip)
  end 

  #the customer is going to look at all the meals
  #and select the ones that belong to them
  def meals 
    Meal.all.select do |meal|
        meal.customer == self 
    end
  end 

  def waiters 
    meals.map do |meal| 
        meal.waiter
    end
  end

end