import Foundation

public class Cat: Pet {
    
    internal weak var owner: Owner?
    
    public init(breed: String, color: String, age: Int, name: String, owner: Owner? = nil) {
        
        self.owner = owner

        super.init(breed: breed, color: color, age: age, name: name)
    }
    
    public func meowing(loudness: Loudness) {
        
        print("\(name) is meowing \(loudness) loud.")
    }
    
    override public func chase(what: Pet) {
        
        var something = "something"
        if what is Mouse {
            something = "mouse"
        }
        
        print("\(name) is chasing a \(what.color) \(something).")
    }
    
    override public func makeSound() {
        
        meowing(Loudness.Soft)
    }
}
