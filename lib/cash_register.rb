require 'pry'

class CashRegister
    attr_accessor :total, :items, :discount

    def initialize(discount=0)
        @total = 0
        @items = []
        @discount = discount
    end

    def add_item(title, price, quantity=1)
        @previous_total = self.total
        self.total += price * quantity
        quantity.times { self.items << title }
    end

    def apply_discount
        if self.discount == 20
            self.total -= self.total * 0.2
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.items.pop
        self.total = @previous_total
    end
    
end

#binding.pry