/*:
 * callout(Exercise): Create two classes `Dog` and `Cat`. Each will have properties of `breed`, `color`, `age` and `name`. They also have methods of `barking` (dog's) only, `meowing` (cats only), `eating`, `sleeping`, `playing`, and `chase`.
 
 **Constraints:**
 - Initializer & Deinitializer
 - Computed Properties
 - Property Observers
 - Method body is up to you, but your method signatures need parameter(s)
 */
import Foundation

class Dog {
    
    static let humanYearsMultiplier = 7
    
    var breed: String
    var color: String
    var age: Int {
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
    var name: String
    
    var description: String {
        
        return "\(name) is a \(age) year old \(color) \(breed)."
    }

    var humanYears: Int {
        
        return age * Dog.humanYearsMultiplier
    }
    
    init(breed: String, color: String, age: Int, name: String) {
        
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
    }
    
    deinit {

        print("\(name) is buried")
    }
    
    func barking(loudness: Loudness) {
        
        print("\(name) is barking \(loudness).")
    }
    
    func eating(what: String) {
        
        print("\(name) is eating \(what).")
    }

    func sleeping(when: When) {
        
        print("\(name) is sleeping in the \(when).")
    }
    
    func playing(what: String) {
        
        print("\(name) is playing \(what).")
    }
    
    func chase(what: Cat) {
        
        print("\(name) is chasing \(what.name) the cat.")
    }
}

class Cat {

    var breed: String
    var color: String
    var age: Int
    var name: String
    
    var description: String {
        
        return "\(name) is a \(age) year old \(color) \(breed)."
    }

    init(breed: String, color: String, age: Int, name: String) {
        
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
    }
    
    deinit {
        
        print("\(name) is buried")
    }
    
    func meowing(loudness: Loudness) {
        
        print("\(name) is meowing \(loudness).")
    }
    
    func eating(what: String) {
        
        print("\(name) is eating \(what).")
    }
    
    func sleeping(when: When) {
        
        print("\(name) is sleeping \(when).")
    }
    
    func playing(what: String) {
        
        print("\(name) is playing \(what).")
    }
    
    func chase(what: Mouse) {
        
        print("\(name) is chasing a \(what.color) mouse.")
    }
}

enum Loudness {
    case Soft
    case Medium
    case Very
}

enum When {
    case AM
    case PM
}

struct Mouse {

    var color: String

    init(color: String) {

        self.color = color
    }
}

let mouse = Mouse(color: "black")

var snowy: Cat? = Cat(breed: "Siamese", color: "white", age: 8, name: "Snowy")
print("\(snowy!.description)")
snowy!.meowing(loudness: Loudness.Very)
snowy!.eating(what: "dog food")
snowy!.sleeping(when: When.PM)
snowy!.playing(what: "with yarn")
snowy!.chase(what: mouse)

print("")

var fido: Dog? = Dog(breed: "Greyhound", color: "fawn", age: 6, name: "Fido")
print("\(fido!.description)")

print("\(fido!.name) is \(fido!.humanYears) in dog years.")

fido!.barking(loudness: Loudness.Soft)
fido!.eating(what: "dog food")
fido!.sleeping(when: When.AM)
fido!.playing(what: "with a ball")
fido!.chase(what: snowy!)
fido!.age = 10
fido!.age = 13

print("")
fido = nil
snowy = nil
