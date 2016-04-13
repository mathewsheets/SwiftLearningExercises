import Foundation

public class Owner {
    
    public var name: String
    
    public var dogs = [Dog]()
    public var cats = [Cat]()
    
    public var description: String {
        
        return "\(name) has \(dogs.count) dog(s) and \(cats.count) cat(s)."
    }
    
    public init(name: String) {
        
        self.name = name
    }
    
    deinit {

        print("\(name) is buried")
    }
    
    public func addDog(dog: Dog) {
        
        dogs.append(dog)
    }
    
    public func addCat(cat: Cat) {
        
        cat.owner = self

        cats.append(cat)
    }

    public subscript(index: Int, type: PetType) -> (Dog?, Cat?)? {

        switch type {
        case .Cat:
            return (dog: nil, cat: cats[index])
        case .Dog:
            return (dog: dogs[index], cat: nil)
        }
    }
}
