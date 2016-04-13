import Foundation

public class Pet {
    
    private var breed: String
    internal var color: String

    public var age: Int
    public var name: String
    
    public var description: String {
        
        return "\(name) is a \(age) year old \(color) \(breed)."
    }
    
    public init(breed: String, color: String, age: Int, name: String) {
        
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
    }
    
    deinit {
        
        print("\(name) is buried")
    }
    
    public func eating(what: String) {
        
        print("\(name) is eating \(what).")
    }
    
    public func sleeping(when: When) {
        
        print("\(name) is sleeping in the \(when).")
    }
    
    public func playing(what: String) {
        
        print("\(name) is playing \(what).")
    }

    public func chase(what: Pet) {
        
        print("\(name) is chasing a pet.")
    }
    
    public func makeSound() {
        
        print("zzzzzzz")
    }
}
