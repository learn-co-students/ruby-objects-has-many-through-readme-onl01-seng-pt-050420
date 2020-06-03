class Meal
     @@all = []
    attr_accessor :waiter, :customer, :total, :tip
    def initialize(waiter, customer,total, tip)
        @waiter = waiter
        @customer = customer
        @tip = tip
        @total = total
        @@all << self
    end

    def self.all
        @@all
    end

end