import Foundation

public class Dog {
    
    static let dogYearsMultiplier = 7
    
    private var breed: String
    private var color: String
    
    public var age: Int {
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
    public var name: String
    
    public var description: String {
        
        return "\(name) is a \(age) year old \(color) \(breed)."
    }
    
    public var dogYears: Int {
        
        return age * Dog.dogYearsMultiplier
    }
    
    public unowned var owner: Owner
    
    public init(breed: String, color: String, age: Int, name: String, owner: Owner) {
        
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
        self.owner = owner
    }

    public convenience init(color: String, age: Int, owner: Owner) {

        self.init(breed: "Mutt", color: color, age: age, name: "Unknown", owner: owner)

        owner.addDog(dog: self)
    }

    deinit {
        
        print("\(name) is buried")
    }
    
    public func barking(loudness: Loudness) {
        
        print("\(name) is barking \(loudness).")
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
    
    public func chase(what: Cat) {
        
        print("\(name) is chasing \(what.name) the cat.")
    }
}
