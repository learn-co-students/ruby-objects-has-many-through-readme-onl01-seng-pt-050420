class Meal
  @@all = []
attr_accessor :waiter, :customer, :total, :tip
attr_reader :name
attr_writer 
  def initialize(waiter, customer, total, tip)
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