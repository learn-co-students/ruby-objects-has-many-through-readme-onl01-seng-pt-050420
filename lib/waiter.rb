class Waiter  

    @@all = []

    attr_accessor :name, :yr_experience 

    def initialize(name, yr_experience) 
        @name = name  
        @yr_experience = yr_experience  
        @@all << self 
    end 
    
    def self.all 
        @@all 
    end 

    def new_meal(customer, total, tip) 
        Meal.new(self, customer, total, tip) 
    end 

    def meals
        Meal.all.select do |meal|
          meal.waiter == self #checking for waiter now
        end
    end 
   
    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
         meal_a.tip <=> meal_b.tip
     end
 
         best_tipped_meal.customer
     end
end