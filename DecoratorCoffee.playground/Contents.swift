import Cocoa

protocol Coffee {
    var cost: Double { get }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init (base: Coffee)
}

class SimpleCoffee: Coffee
{
    var cost: Double
    
    init (cost: Double)
    {
        self.cost = cost
    }
}


class Milk: CoffeeDecorator {
    
    var cost: Double {
        return base.cost + 25
    }
    
    let base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
}

class Sugar: CoffeeDecorator {
    var cost: Double {
        return base.cost + 10
    }
    
    let base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
}


class Whip: CoffeeDecorator {
    var cost: Double {
        return base.cost + 50
    }
    
    let base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
}

let coffee = SimpleCoffee(cost: 50)
let milkCofee = Milk(base: coffee)
let milkSugarCofee = Sugar(base: milkCofee)
let whipCoffee = Whip(base: coffee)

print (coffee.cost)
print(milkCofee.cost)
print(milkSugarCofee.cost)
print(whipCoffee.cost)
