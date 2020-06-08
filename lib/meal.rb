class Meal
  attr_accessor :waiter, :customer, :total, :tip 

@@all =[]

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
  
  def gross_income
    self.all.total.each { |total| total + total }
  end
  
  def all_tips
    self.all.tip.each { |tips| tips + tips }
  end
end