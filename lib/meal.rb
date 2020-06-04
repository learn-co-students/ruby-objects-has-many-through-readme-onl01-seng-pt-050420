class Meal
  # this part of the code is going to give both the customer and waiter instances the 
  # ability to get all the information about the meal that they need 
  # without having to store it themselve
  attr_accessor :waiter, :customer, :total, :tip
   
    @@all = []
   
    def initialize(waiter, customer, total, tip=0)
      @waiter = waiter
      @customer = customer
      @total = total
      @tip = tip
      @@all << self
    end
   
    def self.all
      @@all
    end

  end

# relationship with the waiter is through your meal.
# set up our Meal class as a 'joining' model between 
# our Waiter and our Customer classes.
# the Meal class needs to know all the details of each meal instance
# the Meal class needds to know the total cost and tip (tip defaults to 0)
# the Meal class needs to know who the customer and waiter are for each instance of a meal