class Customer
  
  attr_accessor :name, :age
  attr_reader
  attr_writer

    # We want to make sure when building out classes, that there's something to store each instance.
    # The class should know about each class instance that gets created, we store those in @@all
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end
     
    def self.all
        @@all
    end
     
    # create a meal as a customer
    # associates the meal with the customer(self) that created it
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    # we need a way for our customer and waiter instances to 
    # get information about each other.
    # we can get info about waiter through the meals they've created
    # a customer might want to know the name of the waiter 
    # the customer is going to look at all of the meals, 
    # and then select only the ones that belong to them.

    def meals
        Meal.all.select {|meal| meal.customer == self}    
    end
    # a way for a customer to know about all of their meals
    # this method iterates through every instance of the Meal class
    # returns only the ones where the meal's customer matches the current customer
    # this method only returns the meal the customer is associated with.

    # this method will return all the waiters associated with the customer
    # gets every waiter from every meal a customer created
    # gets the waiter from each of the meals
    def waiters
        meals.map {|meal| meal.waiter}
    end

    # find the name of the customer's last waiter
    # customer.waiters.last.name

end