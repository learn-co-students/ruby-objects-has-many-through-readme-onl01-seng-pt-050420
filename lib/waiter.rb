class Waiter
  attr_accessor :name, :yrs_experience
  
  @@all =[]
  
  def initialize(name, yrs_experience)
    @name = name 
    @yrs_experience = yrs_experience
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end 
  
  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end 
  
  def best_tipper
    best_tip = meals.max { |a, b| a.tip <=> b.tip }
    best_tip.customer
  end 
  
  def worst_tipper
    worst_tip = meals.min { |a, b| a.tip <=> b.tip }
    worst_tip.customer
  end 
  
  def most_frequent_customer
    Customer.all.select { |patron| patron.waiter == self } 
  end 
  
  def tips
    Meal.all.select { |waiter| waiter.tip == self }
  end
  
  def most_tips
    highest_tips = tips.max { |a, b| a.tip <=> b.tip }
    highest_tips.waiter
  end
  
  def most_experienced
    self.all.yrs_experience.sort
  end
end