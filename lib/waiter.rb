class Waiter
 
  attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end

    # create a meal
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    # we need a way for our customer and waiter instances to 
    # get information about each other.
    # we can get info about customer through the meals they've created
    # a waiter might want to know who their regular customers are
    # and what meals those customers usually order
    # a method so a waiter can find a customer
    def meals
        Meal.all.select do |meal|
          meal.waiter == self #checking for waiter now
        end
    end
    # a way for a waiter to find all the meals they created

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
    end
   
  end

  # a customer can have many meals.
  # different instances of the meal
  # relationship with the customer is through your waiter.
