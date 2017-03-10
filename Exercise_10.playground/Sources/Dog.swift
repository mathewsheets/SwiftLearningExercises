import Foundation

public class Dog: Pet {
    
    override public var age: Int {
        willSet {
            
            if newValue >= 10 {
                print("\(name) will die in a couple of years.")
            }
        }
        didSet {
            
            if age >= 12 {
                print("\(name) died.")
            }
        }
    }
    
    internal unowned var owner: Owner
    
    public init(breed: String, color: String, age: Int, name: String, owner: Owner) {
        
        self.owner = owner

        super.init(breed: breed, color: color, age: age, name: name)
    }

    public func barking(loudness: Loudness) {
        
        print("\(name) is barking \(loudness) loud.")
    }
    
    override public func chase(what: Pet) {
        
        var something = "something"
        if what is Cat {
            something = "cat"
        }
        print("\(name) is chasing \(what.name) a \(something).")
    }
    
    override public func makeSound() {
        
        barking(loudness: Loudness.Very)
    }
}
