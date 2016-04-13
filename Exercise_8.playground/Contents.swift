/*:
 * callout(Exercise): Create two classes `Dog` and `Cat`. Each will have properties of `breed`, `color`, `age` and `name`. They also have methods of `barking` (dog's) only, `meowing` (cats only), `eating`, `sleeping`, `playing`, and `chase`.
 
 **Constraints:** You must also have:
 - Initializer & Deinitializer
 - Computed Properties
 - Property Observers
 - Method body is up to you, but your method signatures need parameter(s)
 */
import Foundation

enum Loudness {
    case Soft
    case Medium
    case Very
}

enum When {
    case AM
    case PM
}

class Dog {
    
    static let dogYearsMultiplier = 7
    
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

    var dogYears: Int {
        
        return age * Dog.dogYearsMultiplier
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

struct Mouse {

    var color: String

    init(color: String) {

        self.color = color
    }
}

let mouse = Mouse(color: "black")

var snowy: Cat?  = Cat(breed: "Siamese", color: "white", age: 8, name: "Snowy")
print("\(snowy!.description)")
snowy!.meowing(Loudness.Very)
snowy!.eating("dog food")
snowy!.sleeping(When.PM)
snowy!.playing("with yarn")
snowy!.chase(mouse)

print("")

var fido: Dog? = Dog(breed: "Greyhound", color: "fawn", age: 6, name: "Fido")
print("\(fido!.description)")

print("\(fido!.name) is \(fido!.dogYears) in dog years.")

fido!.barking(Loudness.Soft)
fido!.eating("dog food")
fido!.sleeping(When.AM)
fido!.playing("with a ball")
fido!.chase(snowy!)
fido!.age = 10
fido!.age = 13

print("")
fido = nil
snowy = nil
