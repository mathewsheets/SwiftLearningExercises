import Foundation

public class Cat {
    
    private var breed: String
    private var color: String
    
    public var age: Int
    public var name: String
    
    internal weak var owner: Owner?
    
    public var description: String {
        
        return "\(name) is a \(age) year old \(color) \(breed)."
    }
    
    public init(breed: String, color: String, age: Int, name: String) {
        
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
    }
    
    public convenience init(color: String, age: Int) {
        
        self.init(breed: "Mixed", color: color, age: age, name: "Unknown")
    }
    
    deinit {
        
        print("\(name) is buried")
    }
    
    public func meowing(loudness: Loudness) {
        
        print("\(name) is meowing \(loudness).")
    }
    
    public func eating(what: String) {
        
        print("\(name) is eating \(what).")
    }
    
    public func sleeping(when: When) {
        
        print("\(name) is sleeping \(when).")
    }
    
    public func playing(what: String) {
        
        print("\(name) is playing \(what).")
    }
    
    public func chase(what: Mouse) {
        
        print("\(name) is chasing a \(what.color) mouse.")
    }
}
