class Customer
    attr_accessor :name, :age
   
    @@all = []
   
    def initialize(name, age)
      @name = name
      @age = age
      @@all << self
    end
   
    def self.all
      @@all
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    def meals           #the customer is going to look at all of the meals, and then select only the ones that belong to them. 
        Meal.all.select do |meal|   #We're iterating through every instance of Meal and returning only the ones where the meal's customer matches the current customer instance.
          meal.customer == self     
        end
    end
    
    def waiters     #Since we already have a #meals method to get an array of meals, we can reuse it here and write a #waiters method 
        meals.map do |meal| #to get every waiter from every meal a customer has had, we need to take the array of all of the customer's meals, map over it, getting the waiter from each of those meals.
          meal.waiter
        end
    end
end